#! /bin/bash

mv ~/.vimrc ~/.vimrc.bah
mv ~/.vim ~/.vimrc.bak
mv ~/.bashrc ~/.bashrc.bak
ln -s ~/.config/dots/vim/vimrc ~/.vimrc
ln -s ~/.config/dots/vim/vim ~/.vim
ln -s ~/.config/dots/bash/bashrc ~/.bashrc
ln -s ~/.config/dots/bash/bash_aliases ~/.bash_aliases
sudo ln -s ~/.config/dots/bin/googler /bin/googler

sudo apt-get install tree
