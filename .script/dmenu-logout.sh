#!/usr/bin/env sh

ANS="$(printf "Lock\nShutdown\nReboot\nExit" | dmenu -i -p 'System')"
case "$ANS" in
	Lock) i3lock -c 000000;;
	Shutdown) shutdown now;;
	Reboot) reboot;;
	Exit) i3-msg exit
esac
