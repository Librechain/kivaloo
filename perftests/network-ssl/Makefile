.POSIX:
# AUTOGENERATED FILE, DO NOT EDIT
PROG=test_network_ssl
SRCS=main.c elasticarray.c ptrheap.c timerqueue.c asprintf.c monoclock.c sock.c warnp.c events_immediate.c events_network.c events_network_selectstats.c events_timer.c events.c network_read.c network_write.c network_ssl.c network_ssl_compat.c
IDIRS=-I ../../libcperciva/datastruct -I ../../libcperciva/util -I ../../libcperciva/events -I ../../libcperciva/network -I ../../lib/network_ssl
LDADD_REQ=-lssl -lcrypto
SUBDIR_DEPTH=../..
RELATIVE_DIR=perftests/network-ssl

all:
	if [ -z "$${HAVE_BUILD_FLAGS}" ]; then \
		cd ${SUBDIR_DEPTH}; \
		${MAKE} BUILD_SUBDIR=${RELATIVE_DIR} \
		    BUILD_TARGET=${PROG} buildsubdir; \
	else \
		${MAKE} ${PROG}; \
	fi

install:${PROG}
	mkdir -p ${BINDIR}
	cp ${PROG} ${BINDIR}/_inst.${PROG}.$$$$_ &&	\
	    strip ${BINDIR}/_inst.${PROG}.$$$$_ &&	\
	    chmod 0555 ${BINDIR}/_inst.${PROG}.$$$$_ && \
	    mv -f ${BINDIR}/_inst.${PROG}.$$$$_ ${BINDIR}/${PROG}
	if ! [ -z "${MAN1DIR}" ]; then			\
		mkdir -p ${MAN1DIR};			\
		for MPAGE in ${MAN1}; do						\
			cp $$MPAGE ${MAN1DIR}/_inst.$$MPAGE.$$$$_ &&			\
			    chmod 0444 ${MAN1DIR}/_inst.$$MPAGE.$$$$_ &&		\
			    mv -f ${MAN1DIR}/_inst.$$MPAGE.$$$$_ ${MAN1DIR}/$$MPAGE;	\
		done;									\
	fi

clean:
	rm -f ${PROG} ${SRCS:.c=.o}

${PROG}:${SRCS:.c=.o}
	${CC} -o ${PROG} ${SRCS:.c=.o} ${LDFLAGS} ${LDADD_EXTRA} ${LDADD_REQ} ${LDADD_POSIX}

main.o: main.c ../../libcperciva/util/asprintf.h ../../libcperciva/events/events.h ../../libcperciva/util/sock.h ../../libcperciva/util/warnp.h ../../lib/network_ssl/network_ssl.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c main.c -o main.o
elasticarray.o: ../../libcperciva/datastruct/elasticarray.c ../../libcperciva/datastruct/elasticarray.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/datastruct/elasticarray.c -o elasticarray.o
ptrheap.o: ../../libcperciva/datastruct/ptrheap.c ../../libcperciva/datastruct/elasticarray.h ../../libcperciva/datastruct/ptrheap.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/datastruct/ptrheap.c -o ptrheap.o
timerqueue.o: ../../libcperciva/datastruct/timerqueue.c ../../libcperciva/datastruct/ptrheap.h ../../libcperciva/datastruct/timerqueue.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/datastruct/timerqueue.c -o timerqueue.o
asprintf.o: ../../libcperciva/util/asprintf.c ../../libcperciva/util/asprintf.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/util/asprintf.c -o asprintf.o
monoclock.o: ../../libcperciva/util/monoclock.c ../../libcperciva/util/warnp.h ../../libcperciva/util/monoclock.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/util/monoclock.c -o monoclock.o
sock.o: ../../libcperciva/util/sock.c ../../libcperciva/util/imalloc.h ../../libcperciva/util/parsenum.h ../../libcperciva/util/warnp.h ../../libcperciva/util/sock.h ../../libcperciva/util/sock_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/util/sock.c -o sock.o
warnp.o: ../../libcperciva/util/warnp.c ../../libcperciva/util/warnp.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/util/warnp.c -o warnp.o
events_immediate.o: ../../libcperciva/events/events_immediate.c ../../libcperciva/datastruct/mpool.h ../../libcperciva/events/events.h ../../libcperciva/events/events_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/events/events_immediate.c -o events_immediate.o
events_network.o: ../../libcperciva/events/events_network.c ../../libcperciva/util/ctassert.h ../../libcperciva/datastruct/elasticarray.h ../../libcperciva/util/warnp.h ../../libcperciva/events/events.h ../../libcperciva/events/events_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/events/events_network.c -o events_network.o
events_network_selectstats.o: ../../libcperciva/events/events_network_selectstats.c ../../libcperciva/util/monoclock.h ../../libcperciva/events/events.h ../../libcperciva/events/events_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/events/events_network_selectstats.c -o events_network_selectstats.o
events_timer.o: ../../libcperciva/events/events_timer.c ../../libcperciva/util/monoclock.h ../../libcperciva/datastruct/timerqueue.h ../../libcperciva/events/events.h ../../libcperciva/events/events_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/events/events_timer.c -o events_timer.o
events.o: ../../libcperciva/events/events.c ../../libcperciva/datastruct/mpool.h ../../libcperciva/events/events.h ../../libcperciva/events/events_internal.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/events/events.c -o events.o
network_read.o: ../../libcperciva/network/network_read.c ../../libcperciva/events/events.h ../../libcperciva/datastruct/mpool.h ../../libcperciva/network/network.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/network/network_read.c -o network_read.o
network_write.o: ../../libcperciva/network/network_write.c ../../libcperciva/events/events.h ../../libcperciva/datastruct/mpool.h ../../libcperciva/util/warnp.h ../../libcperciva/network/network.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../libcperciva/network/network_write.c -o network_write.o
network_ssl.o: ../../lib/network_ssl/network_ssl.c ../../libcperciva/events/events.h ../../libcperciva/util/warnp.h ../../lib/network_ssl/network_ssl.h ../../lib/network_ssl/network_ssl_compat.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../lib/network_ssl/network_ssl.c -o network_ssl.o
network_ssl_compat.o: ../../lib/network_ssl/network_ssl_compat.c ../../lib/network_ssl/network_ssl_compat.h
	${CC} ${CFLAGS_POSIX} -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -DCPUSUPPORT_CONFIG_FILE=\"cpusupport-config.h\"  -I../.. ${IDIRS} ${CPPFLAGS} ${CFLAGS} -c ../../lib/network_ssl/network_ssl_compat.c -o network_ssl_compat.o

test:	all
	@./test_network_ssl.sh
