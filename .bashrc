#
#   _               _
#  | |__   __ _ ___| |__
#  | '_ \ / _` / __| '_ \ 
#  | |_) | (_| \__ \ | | |
#  |_.__/ \__,_|___/_| |_|
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load shell-agnostic configs
source ~/.shellrc

# Vim mode
set -o vi

# Bash prompt
export PS1="\033[1;34m\u@\h \033[0min \033[1;32m\w\n\033[0m\$ "
