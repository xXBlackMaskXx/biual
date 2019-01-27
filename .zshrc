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
	zgen oh-my-zsh plugins/command-not-found
	zgen oh-my-zsh plugins/vi-mode
	
	# Theme
	zgen load dawidpotocki/agnoster-zsh-theme agnoster.zsh-theme

zgen save
fi

# Load shell-agnostic configs
source ~/.shellrc

# Vim mode
bindkey -v


fpath=($HOME/.zsh-completions $fpath)
