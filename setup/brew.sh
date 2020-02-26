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
  tmuxinator
  neovim
  jq
  youtube-dl
"

DEV="
  python3
  node
  yarn
  ghc
  cabal-install
  postgresql
"

brew install \
  $GNU\
  $TOOLS\
  $DEV
