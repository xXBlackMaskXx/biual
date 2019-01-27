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

# Required for "limited" git functionality for bash prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Bash prompt
export PS1="\033[1;34m\u@\h \033[0min \033[1;32m\w \033[0mon \033[1;35m\$(parse_git_branch)\n\033[0m\$ "
