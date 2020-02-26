#!/bin/bash
#
# This script configures MacOS
#

THIS_DIR=$(dirname $BASH_SOURCE)

# installs XCode
xcode-select --install

# default config
defaults write -g ApplePressAndHoldEnabled -bool false;
defaults write com.apple.finder AppleShowAllFiles true;
defaults write com.apple.screencapture type PNG;
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;
mkdir ~/Documents/screenshots;
defaults write com.apple.screencapture location "~/Documents/screenshots";
defaults write com.apple.finder CreateDesktop false;
defaults write -g WebAutomaticTextReplacementEnabled -bool true;

# installs brew
yes "" | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# installs apps with brew
/bin/sh $THIS_DIR/brew.sh
/bin/sh $THIS_DIR/cask.sh
