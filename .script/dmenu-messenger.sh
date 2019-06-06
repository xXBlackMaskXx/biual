#!/usr/bin/env sh

ANS="$(printf "Riot (Tor :9050)\nRiot (Tor :9150)\nRiot\nTelegram\nSignal\nWire (Tor :9050)\nWire (Tor :9150)\nWire" | dmenu -i -p 'Messenger')"
case "$ANS" in
	"Riot (Tor :9050)") riot-desktop --proxy-server=socks5://127.0.0.1:9050;;
	"Riot (Tor :9150)") riot-desktop --proxy-server=socks5://127.0.0.1:9150;;
	"Riot") riot-desktop;;
	"Telegram") Telegram;;
	"Signal") signal-desktop;;
	"Wire (Tor :9050)") wire-desktop --proxy-server=socks5://127.0.0.1:9050;;
	"Wire (Tor :9150)") wire-desktop --proxy-server=socks5://127.0.0.1:9150;;
	"Wire") wire-desktop
esac
