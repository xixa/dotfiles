#!/bin/bash

GNU="
  coreutils
  findutils
  gnu-tar
  gnu-sed
  gawk
  gnutls
  gnu-indent
  gnu-getopt
  make
"

TOOLS="
  grep
  the_silver_searcher
  ripgrep
  ack
  fzf
  tree
  tmux
  neovim
  jq
  youtube-dl
  ffmpeg
"

DEV="
  asdf
"

OSX="
  qlstephen
  qlvideo
  qlmarkdown
  osxfuse
"

brew install \
  $GNU\
  $TOOLS\
  $DEV\
  $OSX
