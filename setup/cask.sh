#!/bin/bash

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
  postman
  nvalt
  firefox
  google-chrome
  google-chrome-canary
  docker
"

brew cask install \
  $APPS
