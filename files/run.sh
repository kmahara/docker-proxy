#!/bin/sh

trap_TERM() {
	echo 'SIGTERM ACCEPTED.'
	/etc/init.d/squid stop
	echo "Stop done."
	exit 0
}

trap 'trap_TERM' TERM

/etc/init.d/squid start
echo "Start done."

while :
do
	sleep 365d &
	wait
done
