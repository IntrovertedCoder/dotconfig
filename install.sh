#! /bin/bash
rm ~/.config/fish
ln -s ~/.config/dots/fish/ ~/.config/fish
rm ~/.vim
ln -s ~/.config/dots/vim/vim/ ~/.vim
rm ~/.vimrc
ln -s ~/.config/dots/vim/vimrc ~/.vimrc

sudo ln -s ~/.config/dots/bin/googler /bin/googler

sudo apt install tree
sudo apt install wget
sudo ln -s ~/.config/dots/scripts/scan /bin/scan
