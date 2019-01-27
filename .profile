#!/usr/bin/env bash

export PATH="$PATH:$HOME/.local/bin"
export QT_QPA_PLATFORMTHEME=gtk2
export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="qutebrowser"
export TERMINAL="st"
export EDITOR="nvim"
export SSH_AUTH_SOCK

# Start graphical server if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx :0
