#! /bin/bash

mv ~/.vimrc ~/.vimrc.bah
mv ~/.vim ~/.vimrc.bak
mv ~/.bashrc ~/.bashrc.bak

ln -s ~/.config/dots/vim/vimrc ~/.vimrc
ln -s ~/.config/dots/vim/vim ~/.vim
ln -s ~/.config/dots/bash/bashrc ~/.bashrc
ln -s ~/.config/dots/bash/bash_aliases ~/.bash_aliases
mkdir ~/.config/fish
ln -s ~/.config/dots/fish/config.fish ~/.config/fish/config.fish
ln -s ~/.config/dots/fish/fish_variables ~/.config/fish/fish_variables
ln -s ~/.config/dots/fish/functions/ ~/.config/fish/functions
sudo ln -s ~/.config/dots/ssh/sshd_config /etc/ssh/sshd_config
sudo ln -s ~/.config/dots/bin/googler /bin/googler

export EDITOR=/usr/bin/vim

sudo apt-get install tree
sudo apt-get install wget
