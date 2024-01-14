cp ~/.vimrc  ~/Installs/dot-files -v
cp ~/.bashrc ~/Installs/dot-files -v
cp ~/.bash_aliases ~/Installs/dot-files -v
cp ~/udf.sh ~/Installs/dot-files -v

OLD_PWD=$PWD

cd ~/Installs/dot-files
git commit -a -m "updated stuff"
git push

cd $OLD_PWD
