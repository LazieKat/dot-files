#################
# repos to add  #
#################

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
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' 
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ beoan main' 
apt update
apt -y install --install-recommends winehq-stable

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

### gvim

### audacity

# decoders encoders

### ffmpeg

### filezilla

### firefox

### chrome

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


#################
#     others    #
#################

### slack

### discord

### telegram

### steam

### minecraft
