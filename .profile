#!/bin/sh

export NPM_PACKAGES="$HOME/.local/share/npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$HOME/.local/bin:$NPM_PACKAGES/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin:$HOME/.local/share/gems/bin"
export GEM_HOME="$HOME/.local/share/gems"
export PIPX_HOME="$HOME/.local/share/pipx"
export XDG_CONFIG_DIRS="$HOME/.config"
export QT_STYLE_OVERRIDE=adwaita-dark
export BROWSER="firefox"
export TERMINAL="st"
export EDITOR="nvim"
export SSH_AUTH_SOCK

# Start graphical server if window manager not already running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx :0
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x sway >/dev/null && exec sway
