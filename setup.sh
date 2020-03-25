#################
# repos to add  #
#################

add-apt-repository ppa:flexiondotorg/minecraft
add-apt-repository multiverse
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' 
add-apt-repository ppa:ubuntuhandbook1/audacity -y
curl https://download.videolan.org/pub/debian/videolan-apt.asc | sudo apt-key add -
echo "deb https://download.videolan.org/pub/debian/stable ./" | sudo tee /etc/apt/sources.list.d/libdvdcss.list
apt install aptitude
apt update

#################
#  development  #
#################

### python3
apt -y install python3 python3-dev python3-pip python3-venv

# tkinter pygame numpy scipy pandas matplotlib opencv pytorch tensorflow
apt -y install python3-tk python3-opencv
pip3 install sympy pygame numpy scipy pandas matplotlib torch torchvision tensorflow

# django flask bottle pyramid
pip3 install Django Flask bottle pyramid

### c/c++
apt -y install build-essential manpages-dev libgl1-mesa-dev
apt -y install libboost-all-dev

# opengl sfml sdl glfw
apt -y xorg-dev
apt -y install freeglut3-dev
apt -y install libglfw3-dev
apt -y install libsfml-dev
apt -y install libsdl2-dev

### arduino
apt -y install arduino arduino-core

# avr
apt -y install gcc-avr avr-libc binutils-avr gdb-avr avrdude

### matlab octave
apt -y install octave

### java
apt -y install default-jdk

### .net and asp.net core
wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb 
apt -y install apt-transport-https
apt update
apt -y install dotnet-sdk-3.1
apt -y install mono-complete

### android sdk
apt -y install android-sdk

### node.js
apt -y install nodejs npm

### r r-markdown
apt -y install r-base
Rscript -e "install.packages(\"rmarkdown\")"

### LAMP (linux, apache, mysql, php)
apt -y install apache2-dev
#apt -y install apache2
apt -y install mysql-server
apt -y install php libapache2-mod-php

### rust
apt -y install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
source ~/.profile

### go
apt -y install golang

### perl
apt -y install perl perl-debug

### ruby rubyrails
apt -y install ruby-full ruby-rails

### lisp
apt -y install sbcl

### assemblers
apt -y install binutils # gnu assembler
apt -y install nasm

#################
#     tools     #
#################

### cmake
apt -y install cmake

### wine
dpkg --add-architecture i386 
wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
aptitude -y install --install-recommends winehq-stable

### gzip tar
apt -y install gzip tar

### latex
list=$(apt-cache --names-only search ^texlive-* | \
awk '{ print $1 }' | grep -v texlive-lang* | \
awk '{ print $1 }' | grep -v texlive-full)
apt -y install $list

### office
apt -y install libreoffice

### vscode
apt -y install code

### gvim
apt -y install vim-gui-common

### audacity
apt -y install audacity

### vlc and codecs
apt -y install vlc*
apt -y install libdvdcss2 libdvdnav4 libdvdread4

### ffmpeg
apt -y install ffmpeg

### filezilla
apt -y install filezilla

### firefox
apt -y install firefox

### chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt -y install ./chrome.deb
rm ./chrome.deb

#################
#     others    #
#################

### slack
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.0-amd64.deb
apt -y install ./slack.deb
rm ./slack.deb

### discord
wget -O discord.deb https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
apt -y install ./discord.deb
rm ./discord.deb

### telegram
apt -y install telegram-desktop

### steam
apt -y install steam

### minecraft
apt -y install minecraft-launcher

#################
#  engineering  #
#################

### kicad eagle

### ansys

### autocad fusion360 freecad

#################
#     config    #
#################

### my dotfiles

### themes and looks
