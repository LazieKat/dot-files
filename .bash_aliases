alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias v="vim"
# alias bat="batcat"

alias cs="cd /mnt/c/Users/ahmad/OneDrive/AAA/Academics/RU/SAIL"
alias cr="cd ~/Desktop/ros2_ws"
alias cdd="cd ~/Desktop"

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CFhl'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias sb='source ~/.bashrc'
