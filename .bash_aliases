alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias v="vim"
# alias bat="batcat"

alias cdd="cd ~/Desktop"

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CFhl'

alias bat='batcat'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias s='source'
alias sb='source ~/.bashrc'
alias sr='source /opt/ros/humble/setup.bash'

alias c='clear'

alias push-dot='~/Installs/dot-files/udf.sh'
