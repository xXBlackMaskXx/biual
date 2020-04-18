#!/bin/sh
# Sets the background. If given an argument, will set file as background.
[ -n "$1" ] && cp "$1" ~/.config/wallpaper && notify-send -i "$HOME/.config/wallpaper" "Wallpaper changed."
xwallpaper --daemon --zoom ~/.config/wallpaper
