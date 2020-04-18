#!/bin/sh

if grep -E '(^|[^;])tray' ~/.config/polybar/config; then
	temp=$(sed 's/tray/;tray/g' ~/.config/polybar/config)
else
	temp=$(sed 's/;tray/tray/g' ~/.config/polybar/config)
fi

printf "%s" "$temp" > ~/.config/polybar/config
