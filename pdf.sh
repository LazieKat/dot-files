OLD_PWD=$PWD

cd ~/Installs/dot-files
git pull origin master

cp ./.vimrc  ~ -v
cp ./.bashrc ~ -v
cp ./.bash_aliases ~ -v
cp ./.rosrc.sh ~ -v

cd $OLD_PWD
