#!/bin/sh

usage() {
	printf "Usage:
  control-trackpad.sh disable [TRACKPAD]
  control-trackpad.sh enable [TRACKPAD]\n"
	exit 1
}


if [ -z "$1" ]; then
	usage
elif grep -q ThinkPad /sys/class/dmi/id/product_family; then
	if xinput | grep -q "SynPS/2 Synaptics TouchPad"; then
		trackpad="SynPS/2 Synaptics TouchPad"
	elif xinput | grep -q "Synaptics TM3276-022"; then
		trackpad="Synaptics TM3276-022"
	else
		echo "Couldn't recognize your trackpad, please provide a name of it"
		exit 1
	fi
elif [ -z "$2" ]; then
	echo "If you don't use a ThinkPad, you need to provide a name of a trackpad"
	exit 1
fi


if [ "$1" = "enable" ]; then
	xinput enable "$trackpad"
elif [ "$1" = "disable" ]; then
	xinput disable "$trackpad"
else
	usage
fi
