unclutter --timeout 5 --jitter 2 &
setxkbmap -option 'caps:ctrl_modifier'  
xcape -e 'Caps_Lock=Escape'

export QT_QPA_PLATFORMTHEME=gtk2
export XDG_CONFIG_HOME="$HOME/.config"
export BROWSER="qutebrowser"
export TERMINAL="st"
export EDITOR="nvim"
