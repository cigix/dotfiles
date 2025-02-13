[[ $- != *i* ]] && return

if [ "$UID" == 0 ]
then
    BEFORE="\[\e[1;91m\]\H:\w\[\e[0m\]"
    AFTER=" \[\e[1;91m\]\\$\[\e[0m\] "
else
    BEFORE="\[\e[92m\]\u@\[\e[95m\]\h\[\e[92m\]:\w\[\e[0m\]"
    AFTER="\[\e[92m\]>\[\e[0m\] "
fi

source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=verbose
export GIT_PS1_DESCRIBE_STYLE=branch

function set_bash_prompt () {
    local EXIT="$?"
    if test -z "$VIRTUAL_ENV" ; then
      local PYTHON_VIRTUALENV=""
    else
      local PYTHON_VIRTUALENV="(`basename \"$VIRTUAL_ENV\"`)"
    fi
    local ENDING=$AFTER
    if [ $EXIT != 0 ]; then
      ENDING="\[\e[1;31m\] [${EXIT}]\[\e[0m\]${ENDING}"
    fi
    __git_ps1 "$BEFORE" "$ENDING"
    PS1=$PYTHON_VIRTUALENV$PS1
}

PROMPT_COMMAND=set_bash_prompt

export LESS_TERMCAP_mb=$(printf "\e[1;31m")
export LESS_TERMCAP_md=$(printf "\e[1;31m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;44;33m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[1;32m")

if [ -f /etc/bash_completion ]
then
    . /etc/bash_completion
fi

export EDITOR="vim"

alias ll='ls -lh'
alias less='less -XFR'
alias suod='sudo'
alias gti='git'
alias youtube-mp3='yt-dlp --embed-thumbnail -x --audio-format mp3'
alias ma,='man'
alias emptyswap='sudo swapoff -a; sudo swapon -a'
alias rsync='rsync -ahh --info=progress2'
alias dig='echo "Use drill"; :'

mkcd ()
{
    mkdir -p $1 && cd $1
}
gi ()
{
    cmd="${1:1}"
    shift 1
    git "$cmd" "$@"
}
tmp ()
{
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"
}
untemp ()
{
    if [ -z "$TMP_DIR" ]
    then
        echo '$TMP_DIR not set'
    else
        cd /tmp
        rm -rf "$TMP_DIR"
    fi
}
