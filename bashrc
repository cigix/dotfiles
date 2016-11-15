[[ $- != *i* ]] && return

BEFORE="\[\e[92m\]\u@\[\e[95m\]\h\[\e[92m\]:\w\[\e[0m\]"
AFTER="\[\e[92m\]>\[\e[0m\] "

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

if [ -f /etc/bash_completion ]; then
  . /etc/profile.d/bash_completion.sh
fi

export EDITOR="vim"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

alias ls='ls --color=always'
alias grep='grep --color=always'
alias suod='sudo'
alias gti='git'
alias song='curl cigix.noip.me/update.php?eol'
alias ma,='man'

mkcd ()
{
    mkdir -p $1
    cd $1
}
