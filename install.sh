#!/bin/bash

# variables
dir=~/dotfiles
dir_old=/dotfiles_old
files=".bash_profile .vimrc"

# create dotfiles_old in ~
echo "I'm now creating $dir_old for backup, ok?"
mkdir -p $dir_old
echo "...and it's done"

# change to dotfiles dir
echo "I'm now changing to the $dir directory"
cd $dir
echo "...and it's done"

# move possible existing dotfiles in ~ to dotfiles_old, then creat symlinks
for file in $files; do
        echo "I'm now moving old dotfiles from ~ to dotfiles_old"
        mv ~/$file ~/$dir_old
        echo "I'm now creating a symlink to $file in ~"
        ln -s $dir/$file ~/$file
done

# neovim
mkdir ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
