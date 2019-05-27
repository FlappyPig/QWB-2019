#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'need the challenge name as arg1'
	exit 1
fi

CHAL_NAME=$1
export CHAL_NAME


MEMLIMIT=800000000
CPUSHARES=128
MAXPIDS=256

for i in {1..4}; do
	cgcreate -t ctf -g "cpu,memory,pids:$CHAL_NAME/$i"
	echo $MEMLIMIT > /sys/fs/cgroup/memory/$CHAL_NAME/$i/memory.limit_in_bytes
	echo $CPUSHARES > /sys/fs/cgroup/cpu/$CHAL_NAME/$i/cpu.shares
	echo $MAXPIDS > /sys/fs/cgroup/pids/$CHAL_NAME/$i/pids.max
done


#/chall/killer.sh &
xinetd -d -dontfork
