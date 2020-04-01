#!/bin/sh

check_batteries() {
	for battery in /sys/class/power_supply/BAT?; do
		battery_capacity="$(cat "$battery"/capacity)"
		batteries_total="$((batteries_total+battery_capacity))"

		if [ "$battery_capacity" -gt 70 ]; then icon=""
		elif [ "$battery_capacity" -gt 50 ]; then icon=""
		elif [ "$battery_capacity" -gt 30 ]; then icon=""
		else icon=""
		fi

		output="$output$icon $battery_capacity% "
	done

	if [ "$(cat /sys/class/power_supply/AC/online)" = 1 ]; then printf " "
	elif [ "$batteries_total" -lt 20 ]; then printf " "
	fi

	echo " $output"
}


find /sys/class/power_supply/BAT? >/dev/null 2>&1 && check_batteries || printf " "
