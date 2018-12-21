#!/usr/bin/env sh

# dmenu prompts
TYPE="$(printf "Screen\nWindow" | dmenu -i -p 'What do you want to screenshot?')"
SAVE="$(printf "No\nYes"        | dmenu -i -p 'Do you want to copy to clipboard?')"
TIME="$(printf "0.5\n5\n10\n15" | dmenu -i -p 'How many seconds you want to wait?')"

# Set flag if selected "Window"
case "$TYPE" in
	Window) TYPE="-s -u";;
	*)      TYPE=""
esac

# Prepere for screenshot
mkdir "$(xdg-user-dir PICTURES)"/Screenshot
sleep "$TIME"

# Copy to clipboard or save to file
case "$SAVE" in
	Yes) maim $TYPE | xclip -selection clipboard -t image/png;;
	*)   maim $TYPE "$(xdg-user-dir PICTURES)"/Screenshot/"$(date +%G-%m-%d_%s.png)"
esac
