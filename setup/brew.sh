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
  $GNU \
  $TOOLS \
  $DEV \
  $OSX

TAPS="
  caskroom/cask
  homebrew/cask-versions
"

brew tap \
  $TAPS

APPS="
  iterm2
  hammerspoon
  vlc
  transmission
  keka
  nvalt
  firefox
  google-chrome
  google-chrome-canary
  docker
"

DEV_APPS="
  visual-studio-code
  postman
  graphiql
  figma
  firefox-developer-edition
  google-chorme-dev
"

brew cask install \
  $APPS \
  $DEV_APPS
