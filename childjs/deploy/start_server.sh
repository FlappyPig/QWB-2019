#!/bin/bash

if timeout 120 python /opt/pow.py ask 9999999; then
#if timeout 120 python pow.py ask 1; then
	CGID="$(( ( RANDOM % 4 )  + 1 ))"
	cgexec -g "cpu,memory,pids:$CHAL_NAME/$CGID" timeout 20 python -u /opt/server.py
fi
