#
#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|
#


# Load shell-agnostic configs
source ~/.shellrc

# Basic stuff
autoload -U colors && colors
setopt prompt_subst
PROMPT='%B%F{blue}%n%F{blue}@%F{blue}%m%f%b in %B%F{green}%~%f%b $(git_status)
%f%b%(?:$ :%F{red}$ )%f'
setopt autocd
zstyle ':completion:*' rehash true  # Look for new completions
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Alias completion
compdef woman=man
compdef vi=nvim
compdef vim=nvim
compdef nvi=nvim
compdef xbpi=xbps-install
compdef xbpr=xbps-remove
compdef xbpq=xbps-query
compdef biual=git

# Vim-style bindings
bindkey -v
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Other bindings
bindkey '^R' history-incremental-search-backward
autoload edit-command-line; zle -N edit-command-line # Edit line in $EDITOR with C-e:
bindkey '^e' edit-command-line

# Window title
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}
function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (screen*|xterm*|st*|rxvt*|tmux*|putty*|konsole*|gnome*) ]]; then
	autoload -Uz add-zsh-hook
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Multi-dot cd (...)
function expand-multiple-dots() {
    local MATCH
    if [[ $LBUFFER =~ '(^| )\.\.\.+' ]]; then
        LBUFFER=$LBUFFER:fs%\.\.\.%../..%
    fi
}
function expand-multiple-dots-then-expand-or-complete() {
    zle expand-multiple-dots
    zle expand-or-complete
}
function expand-multiple-dots-then-accept-line() {
    zle expand-multiple-dots
    zle accept-line
}
zle -N expand-multiple-dots
zle -N expand-multiple-dots-then-expand-or-complete
zle -N expand-multiple-dots-then-accept-line
bindkey '^I' expand-multiple-dots-then-expand-or-complete
bindkey '^M' expand-multiple-dots-then-accept-line

# Show current branch and if there are any changes
function git_status() {
	ref=$(git symbolic-ref --quiet --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null)
	if [ $? -eq 0 ]; then
		echo -n "on %B%F{magenta}$ref"
		[[ $(git status --short | wc -l) -ne 0 ]] && echo -n "%F{yellow}*"
	fi
}
