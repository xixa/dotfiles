#!/bin/bash

files=$( find . -type f \( -iname ".*" ! -iname ".DS*" ! -iname ".git*" \) )

for file in $files; do
  echo "installing $file now... "
  ln -s $file ~/$file
  echo "done!\n"
done
