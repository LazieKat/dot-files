###### Default Stuff ######

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


HISTCONTROL=ignoreboth      # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=10000
HISTFILESIZE=20000

shopt -s histappend         # append to the history file after each command
shopt -s checkwinsize       # update the values of LINES and COLUMNS after each command


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color ) color_prompt=yes;;
    linux                  ) color_prompt=yes; export TERM=xterm-color;;
    screen                 ) color_prompt=yes; export TERM=xterm-color;;
esac
# 
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



###################################################################################################################


## PROMPT STUFF ################################

git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [[ -n $branch ]]; then
        branch="( $branch"

        dirty=$(git status --porcelain 2>/dev/null)

        if [[ -n $dirty ]];then
            branch="$branch*)"
        else
            branch="$branch)"
        fi
    else
        branch=""
    fi

    echo "$branch"
}


PS_MC1="\033[0;38;5;69m"
PS_MC2="\033[0;38;5;106m"
PS_MC3="\033[0;38;5;214m"
PS_MCD="\033[0m"


if [[ ${EUID} == 0 ]]; then
    PS_MC2="\033[1;38;5;124m"
fi


PS_FIRSTLINE="╭─ "
PS_SECONDLINE="$PS_MCD\n╰─ \\$ "
PS_TIME="$PS_MC3\@ ❯ "
PS_USER="$PS_MC2\u@\h ❯ "
PS_DIR="$PS_MC1\w "

PS1="$PS_FIRSTLINE$PS_TIME$PS_USER$PS_DIR\$(git_branch)$PS_SECONDLINE"

if [ "$color_prompt" != yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

## PATH STUFF ##################################

export PATH=$HOME/.local/bin:/usr/games/bin/:$HOME/Installs/BambuStudio/install_dir/bin:/home/linuxbrew/.linuxbrew/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/
export BAT_PAGER=""

## MAN STUFF ###################################

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

## ROS STUFF ###################################

source ~/.rosrc.sh

## NVM STUFF ###################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

## BASH CUSTOMIZATION ##########################

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

## BASH CUSTOMIZATION ##########################

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/Installs/fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
export FZF_TAB_COMPLETION_PROMPT='> '
export FZF_COMPLETION_AUTO_COMMON_PREFIX=true
export FZF_DEFAULT_OPTS="--style full --height 40%"

bind 'set completion-ignore-case on'
