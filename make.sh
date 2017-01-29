#!/bin/bash

files=$( find . -type f \( -iname ".*" ! -iname ".DS*" ! -iname ".git*" \) )

for file in $files; do
  rm -f ~/$file
  echo "installing $file now... "
  ln -s $HOME/dotfiles/$file ~/$file
  echo "done!"
done
