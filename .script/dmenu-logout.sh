#!/usr/bin/env sh

ANS="$(printf "Lock\nShutdown\nReboot\nExit" | dmenu -i -p 'System')"
case "$ANS" in
	Lock) i3lock -c 000000;;
	Shutdown) sudo init 6;;
	Reboot) sudo reboot;;
	Exit) i3-msg exit
esac
