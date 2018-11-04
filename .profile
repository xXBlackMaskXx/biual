unclutter -idle 5 -jitter 2 -root &
setxkbmap -option 'caps:ctrl_modifier'  
xcape -e 'Caps_Lock=Escape'

export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="qutebrowser"
export TERMINAL="termite"
export EDITOR="nvim"
