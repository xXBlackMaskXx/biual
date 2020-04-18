#!/bin/sh

messenger="$(printf "Riot (Tor :9050)\nRiot (Tor :9150)\nRiot\nKeybase\nSignal" | dmenu -i -p 'Messenger')"
case "$messenger" in
	"Riot (Tor :9050)") exe="riot-desktop --proxy-server=socks5://127.0.0.1:9050" app="Riot";;
	"Riot (Tor :9150)") exe="riot-desktop --proxy-server=socks5://127.0.0.1:9150" app="Riot";;
	"Riot") exe="riot-desktop" app="Riot";;
	"Keybase") exe="run_keybase" app="Keybase";;
	"Signal") exe="signal-desktop" app="Signal";;
esac


# ~/.config/messenger-profiles template:
# app_name:profile_name

if [ -n "$exe" ]; then
	if grep "$app" ~/.config/messenger-profiles; then
		profile="$(printf "Default\n%s" "$(grep "$app" ~/.config/messenger-profiles | cut -d: -f2)" | dmenu -i -p 'Profile')"
		case "$profile" in
			"Default") $exe;;
			*) $exe --profile "$(printf "%s" "$profile" | cut -d: -f2)";;
		esac
	else
		$exe
	fi
fi
