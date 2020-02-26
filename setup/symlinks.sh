#!/bin/bash
#
# This script creates symlinks for the main config files
#

# .bashrc, .bash_profile and .bash_prompt
	ln -s $(MY_DIR)/bash/bash_profile ~/.bash_profile

	ln -s $(MY_DIR)/bash/bashrc ~/.bashrc

	ln -s $(MY_DIR)/bash/bash_prompt ~/.bash_prompt

# tmux
	ln -s $(MY_DIR)/tmux/.tmux.conf ~

# vim/neovim
