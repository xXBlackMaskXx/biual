#!/usr/bin/env sh

if mpc | grep '\[paused\]' 1> /dev/null; then
	printf " "
else
	printf " %s " "$(mpc --format=%title% | awk 'NR==1' | cut -c -22 | sed 's/\s*$//')"
fi
