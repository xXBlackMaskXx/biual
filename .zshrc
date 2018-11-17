#           _     
#   _______| |__  
#  |_  / __| '_ \ 
#   / /\__ \ | | |
#  /___|___/_| |_|
#      


# Zgen, need to zgen reset after changing
source "${HOME}/.config/zgen/zgen.zsh"
if ! zgen saved; then
# Plugins
zgen oh-my-zsh 
zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/command-not-found
zgen oh-my-zsh plugins/vi-mode
zgen load dawidpotocki/agnoster-biual-zsh-theme agnoster-biual.zsh-theme
zgen save
fi

# Vim mode
bindkey -v

# Less pager colors
export LESS_TERMCAP_mb=$(tput setaf 4)
export LESS_TERMCAP_md=$(tput setaf 4)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold && tput setab 8 && tput setaf 1)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput setaf 2)

# Sudo prompt
export SUDO_PROMPT="$(tput setaf 4) sudo $(tput setab 4)$(tput setaf 0)$(echo "\uE0B0")$(tput setab 4)$(tput setaf 0) password for %p $(tput sgr0)$(tput setaf 4)$(echo "\uE0B0")$(tput sgr0) "

# Aliases
alias nc='ncmpcpp'
alias ra='ranger'
alias vi='nvim'
alias vim='nvim'
alias nvi='nvim'
alias please='sudo $(fc -ln -1)'
alias woman='man'
alias wttr='curl wttr.in'
alias weather='curl wttr.in'
alias yt-opus='youtube-dl -x --audio-format opus'
alias yt-vorbis='youtube-dl -x --audio-format vorbis'

# biual aliases
alias biual='/usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME'
alias biual-pull='/usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME pull && /usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME update-index --assume-unchanged LICENSE README.md && rm -rf LICENSE README.md'
