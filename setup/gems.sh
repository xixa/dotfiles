#!/bin/bash
#
# this script installs all necessary ruby gems
#

GEMS="
  tmuxinator
  neovim
"

gems install $GEMS
