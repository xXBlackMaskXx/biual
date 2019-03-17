#!/usr/bin/env bash

export NPM_PACKAGES="$HOME/.local/share/npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$PATH:$HOME/.local/bin:$NPM_PACKAGES/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
export QT_QPA_PLATFORMTHEME=gtk2
export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="firefox"
export TERMINAL="st"
export EDITOR="nvim"
export SSH_AUTH_SOCK

# Start graphical server if i3 not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx :0
