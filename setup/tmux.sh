#!/bin/bash
#
# This script configures TMUX
#

# installs tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# compiles terminfo stuff so we can have TRU COLORS
tic -x $(MY_DIR)/tmux/xterm-256color-italic.terminfo
tic -x $(MY_DIR)/tmux/tmux-256color.terminfo
tic -x $(MY_DIR)/tmux/tmux.terminfo
