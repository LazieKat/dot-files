alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias v='vim'

alias bat='batcat'

alias  grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -alFh'
alias la='ls -A'
alias  l='ls -CFhl'

alias  t='tree -F'
alias td='tree -dF'
alias ta='tree -aF'

alias   c='clear'
alias clc='clear'

alias push-dot='~/Installs/dot-files/udf.sh'
alias pull-dot='~/Installs/dot-files/pdf.sh'

alias sf='screenfetch'

alias cdd='cd ~/Desktop'
alias cdr='cd ~/ros2_ws'
alias cdi='cd ~/Installs'
alias cdp='cd ~/Installs/PX4-Autopilot'
alias cdy='cd ~/Installs/YAPR'

alias tup='top -u $USER'

alias   s='source'
alias  sb='source ~/.bashrc'
alias  sr='source /opt/ros/humble/setup.bash'
alias slr='source ./install/local_setup.bash'

alias sai='sudo apt install'

alias qgc='nohup ~/Installs/QGC/QGroundControl.AppImage > /dev/null 2>&1 &'

alias gc='git commit -a'
alias gp='git push'
alias gu='git pull'
alias gs='git status'


cdl() {
    if [ "$#" -eq 0 ]; then
        set ~ 
    fi

    cd "$1" || return

    clear

    printf "\n cd -> "
    pwd
    printf "\n"

    ll
}
