#  _               _     
# | |__   __ _ ___| |__  
# | '_ \ / _` / __| '_ \ 
# | |_) | (_| \__ \ | | |
# |_.__/ \__,_|___/_| |_|
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Sudo prompt
export SUDO_PROMPT="$(tput setaf 4) sudo $(tput setab 4)$(tput setaf 0)$(echo "")$(tput setab 4)$(tput setaf 0) password for %p $(tput sgr0)$(tput setaf 4)$(echo "")$(tput sgr0) "

# Aliases
alias ls='ls --color=auto'
alias nc='ncmpcpp'
alias ra='ranger'
alias vi='nvim'
alias vim='nvim'
alias nvi='nvim'
alias please='sudo $(fc -ln -1)'
alias woman='man'
alias yt-opus='youtube-dl -x --audio-format opus'

# biual aliases
alias biual='/usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME'
alias biual-pull='/usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME pull && /usr/bin/git --git-dir=$HOME/.config/biual-git/ --work-tree=$HOME update-index --assume-unchanged LICENSE README.md && rm -rf LICENSE README.md'

# Agnoster Bash theme

DEBUG=0
debug() {
    if [[ ${DEBUG} -ne 0 ]]; then
        >&2 echo -e $*
    fi
}

## Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
CURRENT_RBG='NONE'
SEGMENT_SEPARATOR=''
RIGHT_SEPARATOR=''
LEFT_SUBSEG=''
RIGHT_SUBSEG=''

text_effect() {
    case "$1" in
        reset)      echo 0;;
        bold)       echo 1;;
        underline)  echo 4;;
    esac
}

fg_color() {
    case "$1" in
        black)      echo 30;;
        red)        echo 31;;
        green)      echo 32;;
        yellow)     echo 33;;
        blue)       echo 34;;
        magenta)    echo 35;;
        cyan)       echo 36;;
        white)      echo 37;;
    esac
}

bg_color() {
    case "$1" in
        black)      echo 40;;
        red)        echo 41;;
        green)      echo 42;;
        yellow)     echo 43;;
        blue)       echo 44;;
        magenta)    echo 45;;
        cyan)       echo 46;;
        white)      echo 47;;
    esac;
}

# TIL: declare is global not local, so best use a different name
# for codes (mycodes) as otherwise it'll clobber the original.
# this changes from BASH v3 to BASH v4.
ansi() {
    local seq
    declare -a mycodes=("${!1}")

    debug "ansi: ${!1} all: $* aka ${mycodes[@]}"

    seq=""
    for ((i = 0; i < ${#mycodes[@]}; i++)); do
        if [[ -n $seq ]]; then
            seq="${seq};"
        fi
        seq="${seq}${mycodes[$i]}"
    done
    debug "ansi debug:" '\\[\\033['${seq}'m\\]'
    echo -ne '\[\033['${seq}'m\]'
    # PR="$PR\[\033[${seq}m\]"
}

ansi_single() {
    echo -ne '\[\033['$1'm\]'
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
    local bg fg
    declare -a codes

    debug "Prompting $1 $2 $3"

    # if commented out from kruton's original... I'm not clear
    # if it did anything, but it messed up things like
    # prompt_status - Erik 1/14/17

    #    if [[ -z $1 || ( -z $2 && $2 != default ) ]]; then
    codes=("${codes[@]}" $(text_effect reset))
    #    fi
    if [[ -n $1 ]]; then
        bg=$(bg_color $1)
        codes=("${codes[@]}" $bg)
        debug "Added $bg as background to codes"
    fi
    if [[ -n $2 ]]; then
        fg=$(fg_color $2)
        codes=("${codes[@]}" $fg)
        debug "Added $fg as foreground to codes"
    fi

    debug "Codes: "
    # declare -p codes

    if [[ $CURRENT_BG != NONE && $1 != $CURRENT_BG ]]; then
        declare -a intermediate=($(fg_color $CURRENT_BG) $(bg_color $1))
        debug "pre prompt " $(ansi intermediate[@])
        PR="$PR $(ansi intermediate[@])$SEGMENT_SEPARATOR"
        debug "post prompt " $(ansi codes[@])
        PR="$PR$(ansi codes[@]) "
    else
        debug "no current BG, codes is $codes[@]"
        PR="$PR$(ansi codes[@]) "
    fi
    CURRENT_BG=$1
    [[ -n $3 ]] && PR="$PR$3"
}

# End the prompt, closing any open segments
prompt_end() {
    if [[ -n $CURRENT_BG ]]; then
        declare -a codes=($(text_effect reset) $(fg_color $CURRENT_BG))
        PR="$PR $(ansi codes[@])$SEGMENT_SEPARATOR"
    fi
    declare -a reset=($(text_effect reset))
    PR="$PR $(ansi reset[@])"
    CURRENT_BG=''
}

### virtualenv prompt
prompt_virtualenv() {
    if [[ -n $VIRTUAL_ENV ]]; then
        color=cyan
        prompt_segment $color $PRIMARY_FG
        prompt_segment $color white "$(basename $VIRTUAL_ENV)"
    fi
}


### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user (who am I)
prompt_context() {
    local user=`whoami`

    if [[ $user != $DEFAULT_USER || -n $SSH_CLIENT ]]; then
        prompt_segment black blue "$user"
    fi
}

git_status_dirty() {
    dirty=$(git status -s 2> /dev/null | tail -n 1)
    [[ -n $dirty ]] && echo " ●"
}

# Git: branch/detached head, dirty status
prompt_git() {
    local ref dirty
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        ZSH_THEME_GIT_PROMPT_DIRTY='±'
        dirty=$(git_status_dirty)
        ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
        if [[ -n $dirty ]]; then
            prompt_segment yellow black
        else
            prompt_segment green black
        fi
        PR="$PR${ref/refs\/heads\// }$dirty"
    fi
}

# Dir: current working directory
prompt_dir() {
    prompt_segment blue black '\w'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
    local symbols
    symbols=()
    [[ $RETVAL -ne 0 ]] && symbols+="$(ansi_single $(fg_color red))✘"
    [[ $UID -eq 0 ]] && symbols+="$(ansi_single $(fg_color yellow))⚡"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="$(ansi_single $(fg_color cyan))⚙"

    [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}


######################################################################
## Main prompt

build_prompt() {
    prompt_status
    [[ -z ${AG_NO_CONTEXT+x} ]] && prompt_context
    prompt_virtualenv
    prompt_dir
    prompt_git
    prompt_end
}

# from orig...
# export PS1='$(ansi_single $(text_effect reset)) $(build_prompt) '
# this doesn't work... new model: create a prompt via a PR variable and
# use that.

set_bash_prompt() {
    RETVAL=$?
    PR=""
    PRIGHT=""
    CURRENT_BG=NONE
    PR="$(ansi_single $(text_effect reset))"
    build_prompt

    # uncomment below to use right prompt
    #     PS1='\[$(tput sc; printf "%*s" $COLUMNS "$PRIGHT"; tput rc)\]'$PR
    PS1=$PR
}

PROMPT_COMMAND=set_bash_prompt
