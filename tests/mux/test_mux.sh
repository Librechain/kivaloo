#!/bin/sh

# Paths
LBS=../../lbs/lbs
KVLDS=../../kvlds/kvlds
MUX=../../mux/mux
TESTMUX=./test_mux
STOR=${KIVALOO_TESTDIR:-`pwd`/stor}
SOCKL=$STOR/sock_lbs
SOCKK=$STOR/sock_kvlds
SOCKM=$STOR/sock_mux

## has_pid (cmd):
# Look for ${cmd} in ps; return 0 if ${cmd} exists.
has_pid() {
	cmd=$1
	pid=$(ps -Aopid,args | grep -F "${cmd}" | grep -v "grep") || true
	if [ -n "${pid}" ]; then
		return 0
	fi
	return 1
}

# Clean up any old tests
rm -rf $STOR
rm -f .failed

# Start LBS, KVLDS, and MUX
mkdir $STOR
[ `uname` = "FreeBSD" ] && chflags nodump $STOR
$LBS -s $SOCKL -d $STOR -b 512 -L
$KVLDS -s $SOCKK -l $SOCKL -C 1024
$MUX -t $SOCKK -s $SOCKM

# Verify that we can run requests through MUX.
printf "Testing KVLDS via MUX... "
if $TESTMUX $SOCKM 0.; then
	echo " PASSED!"
else
	echo " FAILED!"
	exit 1
fi

# Verify running several clients at once.
#	( while ! [ -f .failed ]; do $TESTMUX $SOCKM ${X}. || touch .failed; done ) &
printf "Testing multiple clients... "
for X in 1 2 3 4 5 6 7 8 9 10; do
	( $TESTMUX $SOCKM ${X}. || touch .failed; ) &
done
sleep 1
while has_pid $TESTMUX; do
	sleep 1
done
if [ -f .failed ]; then
	echo " FAILED!"
	exit 1
else
	echo " PASSED!"
fi

# Verify that we can ping-pong via KVLDS.
printf "Testing ping-pong... "
( $TESTMUX $SOCKM ping || touch .failed ) &
( $TESTMUX $SOCKM pong || touch .failed ) &
sleep 2
if has_pid $TESTMUX; then
	touch .failed;
fi
if [ -f .failed ]; then
	echo " FAILED!"
	exit 1
else
	echo " PASSED!"
fi

# Verify that we survive the client dying
printf "Testing client disconnection cleanup... "
( $TESTMUX $SOCKM loop & echo $! > $TESTMUX.pid) 2>/dev/null
sleep 1 && kill "$(cat $TESTMUX.pid)"
if $TESTMUX $SOCKM 0.; then
	echo " PASSED!"
else
	echo " FAILED!"
	exit 1
fi
rm $TESTMUX.pid

# Verify that we die if the upstream server dies
printf "Testing server disconnection death... "
( $TESTMUX $SOCKM loop &) 2>/dev/null
sleep 1 && kill `cat $SOCKK.pid`
rm $SOCKK $SOCKK.pid
sleep 1
if kill -s 0 "$(cat $SOCKM.pid)" 2> /dev/null; then
	echo " FAILED!"
	exit 1
else
	echo " PASSED!"
fi
rm $SOCKM $SOCKM.pid

# Restart KVLDS
$KVLDS -s $SOCKK -l $SOCKL -C 1024

# Check that connection limit is enforced
printf "Verifying that connection limit is enforced... "
$MUX -t $SOCKK -s $SOCKM -n 1
( $TESTMUX $SOCKM ping & echo $! > $TESTMUX.1.pid ) 2>/dev/null
( $TESTMUX $SOCKM pong & echo $! > $TESTMUX.2.pid ) 2>/dev/null
sleep 4
if has_pid $TESTMUX; then
	echo " PASSED!"
else
	echo " FAILED!"
	exit 1
fi
kill "$(cat $TESTMUX.1.pid)"
kill "$(cat $TESTMUX.2.pid)"
rm "$TESTMUX.1.pid"
rm "$TESTMUX.2.pid"

# Check that the connection limit doesn't block connections permanently.
printf "Verifying that connection acceptance is resumed... "
if $TESTMUX $SOCKM 0.; then
	echo " PASSED!"
else
	echo " FAILED!"
	exit 1
fi
kill `cat $SOCKM.pid`
rm $SOCKM $SOCKM.pid

# If we're not running on FreeBSD, we can't use utrace and jemalloc to
# check for memory leaks
if ! [ `uname` = "FreeBSD" ]; then
	echo "Can't check for memory leaks on `uname`"

	# Kill the upstream server
	kill `cat $SOCKK.pid`
	rm $SOCKK $SOCKK.pid
	kill `cat $SOCKL.pid`
	rm $SOCKL $SOCKL.pid

	# Clean up storage directory
	rm -rf $STOR

	exit 0
fi

# Check for memory leaks
printf "Checking for memory leaks... "
ktrace -i -f ktrace-mux.out env MALLOC_CONF="junk:true,utrace:true"		\
	$MUX -t $SOCKK -s $SOCKM
for X in 1 2; do
	( $TESTMUX $SOCKM ${X}. || touch .failed ) &
done
sleep 1
while has_pid $TESTMUX; do
	sleep 1
done
if [ -f .failed ]; then
	echo " FAILED!"
	exit 1
fi

# Kill the upstream server, and poke MUX with a new request to make it die
kill `cat $SOCKK.pid`
rm $SOCKK $SOCKK.pid
kill `cat $SOCKL.pid`
rm $SOCKL $SOCKL.pid
$TESTMUX $SOCKM 0. 2>/dev/null

# Process ktrace-kvlds output
kdump -Ts -f ktrace-mux.out |			\
    grep ' mux ' > kdump-mux.out
sh ../tools/memleak/memleak.sh kdump-mux.out mux.leak 2>leak.tmp
rm ktrace-mux.out kdump-mux.out
if grep -q 'leaked 0 bytes' leak.tmp; then
	echo " PASSED!"
	rm mux.leak
else
	cat leak.tmp | tr -d '\n'
	echo && echo "  -> memory leaks shown in mux.leak"
fi
rm leak.tmp

# Clean up storage directory
rm -rf $STOR
