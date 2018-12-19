#!/usr/bin/env bash

ANS="$(echo -e "Lock\nShutdown\nReboot\nExit" | dmenu -i -p 'System')"
case "$ANS" in
	Lock) i3lock-fancy;;
	Shutdown) systemctl -i poweroff;;
	Reboot) systemctl reboot;;
	Exit) i3-msg exit
esac
