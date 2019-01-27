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

zgen save
fi

# Load shell-agnostic configs
source ~/.shellrc

# Vim mode
bindkey -v

# Zsh prompt
PROMPT='%B%F{blue}%n%F{blue}@%F{blue}%m%f%b in %B%F{green}%~%f%b$(git_prompt_info)
%(?:$ :%F{red}$ )%f'

ZSH_THEME_GIT_PROMPT_PREFIX=' on %B%F{magenta}'
ZSH_THEME_GIT_PROMPT_SUFFIX='%f%b'
ZSH_THEME_GIT_PROMPT_DIRTY='%F{yellow}*'
ZSH_THEME_GIT_PROMPT_UNTRACKED='%F{yellow}*'
ZSH_THEME_GIT_PROMPT_CLEAN=''
