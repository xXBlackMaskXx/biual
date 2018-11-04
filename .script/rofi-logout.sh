#!/usr/bin/env bash

ANS="$(rofi -bw 4 -sep "|" -dmenu -i -p 'System' -width 20 \
-hide-scrollbar -line-padding 4 -padding 20 \
-lines 4 <<< "Lock|Shutdown|Reboot|Exit")"
case "$ANS" in
	*Lock) i3lock-fancy;;
	*Shutdown) systemctl -i poweroff;;
	*Reboot) systemctl reboot;;
	*Exit) i3-msg exit
esac
