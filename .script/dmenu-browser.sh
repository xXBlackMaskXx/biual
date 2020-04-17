#!/bin/sh

ANS="$(printf "Firefox\nFirefox Developer Edition\nTor Browser\nChromium\nGNOME Web\nqutebrowser\n|\nSetup (dev)" | dmenu -i -p "Browser")"
case "$ANS" in
	Firefox) setsid --fork firefox;;
	"Firefox Developer Edition") setsid --fork firefox-developer;;
	"Tor Browser") setsid --fork torbrowser-launcher;;
	Chromium) setsid --fork chromium --force-dark-mode;;
	"GNOME Web") setsid --fork epiphany;;
	qutebrowser) setsid --fork qutebrowser;;
	"Setup (dev)") setsid --fork firefox-developer && setsid --fork chromium --force-dark-mode;;
	*) setsid --fork "$ANS"
esac
