#!/usr/bin/env sh

ANS="$(printf "Riot (Tor :9050)\nRiot (Tor :9150)\nRiot\nTelegram\nSignal" | dmenu -i -p 'Messenger')"
case "$ANS" in
	"Riot (Tor :9050)") riot-desktop --proxy-server=socks5://127.0.0.1:9050;;
	"Riot (Tor :9150)") riot-desktop --proxy-server=socks5://127.0.0.1:9150;;
	"Riot") riot-desktop;;
	"Telegram") Telegram;;
	"Signal") signal-desktop --proxy-server=socks5://127.0.0.1:9050
esac
