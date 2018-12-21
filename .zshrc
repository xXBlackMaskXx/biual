#
#           _     
#   _______| |__  
#  |_  / __| '_ \ 
#   / /\__ \ | | |
#  /___|___/_| |_|
#      


# Zgen, need to 'zgen reset' after changing
source "${HOME}/.config/zgen/zgen.zsh"
if ! zgen saved; then

	# Plugins
	zgen oh-my-zsh 
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/vi-mode
	
	# Theme
	zgen load dawidpotocki/agnoster-zsh-theme agnoster.zsh-theme

zgen save
fi

# Load shell-agnostic configs
source .shellrc

# Vim mode
bindkey -v

# Sudo prompt
export SUDO_PROMPT="$(tput setaf 1) sudo $(tput setab 1)$(tput setaf 0)$(echo "\uE0B0")$(tput setab 1)$(tput setaf 0) password for %p $(tput sgr0)$(tput setaf 1)$(echo "\uE0B0")$(tput sgr0) "
