#!/bin/sh

ANS="$(printf "powersave\nperformance" | dmenu -i -p "CPU ($(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor))")"
case "$ANS" in
	powersave|performance) ;;
	*) exit 1
esac

# I don't know how to pass a password to sudo without using pipes.
# We can't use pipes because we need to pipe performance mode to it.

dmenu -P -p "Password" | sudo -S true
echo "$ANS" | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
