cp ~/.vimrc  ~/GitHub/dot-files -v
cp ~/.bashrc ~/GitHub/dot-files -v
cp ~/.bash_aliases ~/GitHub/dot-files -v
cp ~/udf.sh ~/GitHub/dot-files -v

OLD_PWD=$PWD

cd ~/GitHub/dot-files
git commit -a -m "updated stuff"
git push

cd $OLD_PWD
