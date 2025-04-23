#
#~~~~~~   Constants  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#


COLOR_GREEN="\e[1;32m"
COLOR_RED="\e[1;31m"
COLOR_DEFAULT="\e[0m"

LOG_FILE=~/dot_install_log

START_DIR=$PWD

repos=0
gen_tools=0
dev_tools=0
installs_folder=0
desktop=0
update_apt=1

while getopts "rgdiku" opt; do
    case "$opt" in
        r)
            repos=1;;
        g)
            gen_tools=1;;
        d)
            dev_tools=1;;
        i)
            installs_folder=1;;
        k)
            desktop=1;;
        u)
            update_apt=0;;
        *)
            ;;
    esac
done

if (( (repos + gen_tools + dev_tools + installs_folder + desktop) == 0 )); then
    echo "No arguments were provided"
    echo "Usage: setup.sh [options...]"
    echo " -r,  Add repos"
    echo " -g,  General tools"
    echo " -d,  Development tools"
    echo " -i,  My 'Installs' folder"
    echo " -k,  Desktop apps (with GUIs)"
    echo " -u,  Skip 'apt update'"

    exit
fi



#
#~~~~~~   Helper Functions  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#


print_done(){
    printf "\r[$COLOR_GREEN  Done  $COLOR_DEFAULT]\n"
}


print_failed(){
    printf "\r[$COLOR_RED Failed $COLOR_DEFAULT]\n"
}


print_result(){
    if [ $2 -eq $1 ]; then
        print_done
    else
        print_failed
    fi
}


apt_install() {
    echo "------------------ apt_install $1" >> "$LOG_FILE"
    printf "[  ....  ] Installing: %s\r" "$1"
    sudo apt-get install "$1" -y >> $LOG_FILE
    r=$?
    printf "[  ....  ] Installing: %s" "$1"
    print_result 0 $r
}


apt_add_repo(){
    echo "------------------ apt_add_repo $1" >> $LOG_FILE
    printf "[  ....  ] Adding apt repo: %s\r" "$1"
    sudo add-apt-repository "$1" -yn >> $LOG_FILE
    r=$?
    printf "[  ....  ] Adding apt repo: %s" "$1"
    print_result 0 $r
}


curl_download(){
    echo "------------------ curl_download $1" >> $LOG_FILE
    printf "[  ....  ] Downloading %s\r" "%1"
    curl -LsSf $1 -o $2
    r=$?
    printf "[  ....  ] Downloading %s" "$1"
    print_result 0 $r
}


git_clone(){
    echo "------------------ git_clone $1" >> $LOG_FILE
    printf "[  ....  ] Cloning %s\r" "$1"
    git clone --recursive --depth 1 $1
    r=$?
    printf "[  ....  ] Cloning %s" "$1"
    print_result 0 $r
}



#
#~~~~~~   Installations  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#


printf "\n\n---------------------------------------------------\n" >> $LOG_FILE
echo -n $(date) >> $LOG_FILE
printf "\n---------------------------------------------------\n\n" >> $LOG_FILE


#############################################
#   Repos
#############################################

if [ $repos -eq 1 ]; then
    # printf "\n --- Add Repos --- \n"

    # apt_add_repo ppa:jonathonf/vim
    # apt_add_repo ppa:deadsnakes/ppa
    # apt_add_repo ppa:ubuntuhandbook1/audacity
    true
fi

if [ $update_apt -eq 1 ]; then
    printf "[  ....  ] apt update running...\r"
    sudo apt-get update >> $LOG_FILE
    printf "[  ....  ] apt update running..."
    print_result 0 $?
fi


#############################################
#   General Tools
#############################################

if [ $gen_tools -eq 1 ]; then
    printf "\n --- General Tools --- \n"

    apt_install gzip
    apt_install unzip
    apt_install zip
    apt_install tar
    apt_install curl
    apt_install git
    apt_install tree
    apt_install vim

    apt_install ffmpeg
    apt_install suckless-tools
    apt_install pandoc
    apt_install poppler-utils
    apt_install ranger
    apt_install screenfetch
fi


#############################################
#   Development
#############################################

if [ $dev_tools -eq 1 ]; then
    printf "\n --- Development --- \n"

    apt_install python3.12-full
    apt_install python3.12-dev
    # apt_install python3.12-doc
    apt_install python3.12-dbg
    apt_install python-is-python3

    apt_install build-essential
    apt_install manpages-dev
    apt_install glibc-tools
    apt_install binutils-dev
    apt_install clang
    apt_install clangd
    apt_install nasm
     
    apt_install libboost-all-dev
    apt_install freeglut3-dev
    apt_install libglfw3-dev
    apt_install libsfml-dev
    apt_install libsdl2-dev
    apt_install libgl1-mesa-dev

    apt_install default-jre
    apt_install default-jdk
    apt_install default-jdk-doc

    apt_install openjdk-21-jre
    apt_install openjdk-21-jdk
    apt_install openjdk-21-dbg
    apt_install openjdk-21-doc
    apt_install openjdk-21-source

    apt_install octave
    apt_install sbcl

    apt_install cmake
    apt_install make

    apt_install bison
    apt_install flex

    # RUST 
        curl_download https://sh.rustup.rs /tmp/rust.sh
        printf "[  ....  ] Installing rust\r"
        bash /tmp/rust.sh -y >> $LOG_FILE 2>&1
        printf "[  ....  ] Installing rust"
        print_result 0 $?

    # NODE
        printf "$COLOR_RED IMPORTANT: $COLOR_DEFAULT Install nvm and nodejs manually!\n"
fi


#############################################
#   Installs Folder
#############################################

if [ $installs_folder -eq 1 ]; then
    printf "\n --- Installs Folder --- \n"
    mkdir -vp ~/Installs


    cd ~/Installs
    git_clone https://github.com/dylanaraps/fff
    cd fff
    make install


    cd ~/Installs
    git_clone https://github.com/junegunn/fzf
    cd fzf
    ./install --all


    cd ~/Installs
    git_clone https://github.com/lincheney/fzf-tab-completion
fi


#############################################
#   Desktop Apps
#############################################

if [ $desktop -eq 1 ]; then
    printf "\n --- Desktop Apps --- \n"

    curl_download "https://discord.com/api/download?platform=linux&format=deb" /tmp/discord.deb
    apt_install /tmp/discord.deb

    apt_install libreoffice
    apt_install vim-gui-common

    apt_install vlc*
    apt_install audacity
fi



cd $START_DIR
