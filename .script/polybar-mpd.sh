#!/usr/bin/env sh

if mpc | grep '\[paused\]' 1> /dev/null; then
	printf " "
else
	printf " $(mpc --format=%title% | awk 'NR==1') "
fi
