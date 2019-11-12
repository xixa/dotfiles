#!/bin/bash  ╱  ╱  ╱ ╱ ╱
# ╱ ╱ ╱ ╱  A   ╱ ╱ ╱ ╱ ╱
# ╱┳┳╮╭╮┳╮╱╭╮┳╭╮╱ ╱ ╱
# ╱┃┃┃┣┫┣┻╮┃╱┃┃┃╱ ╱ ╱ ╱ ╱
# ╱┛┛┛┻┗┻╱┗╰╯┻╰╯╱ ╱ ╱
# ╱┳┳╭┛┳┓┳┳╮╭╮┏┳┓╭╮┳╭┛
# ╱┃┣┻╮┣╱┃┃┃┣┫╱┃╱╰╮┃┃
# ╱┻┗╱┗┗┛┛┛┛┛┗╱┻╱╰╯╰┻
# ╱ ╱ ╱ ╱ ╱ ╱ ╱ DOTFILE ♡ ╱
# ╱ ╱ ╱ ╱ ╱ ╱ ╱  ╱ ╱ ╱
# ╱ ╱ ╱ ╱ ╱ ╱ ╱
# ╱ ╱ ╱ ╱ ╱ ╱ ╱
# ╱ ╱ ╱ ╱ ╱
# ╱ ╱ ╱                      marcio.ikematsu@usp.br
# ╱

set -o emacs

source $HOME/dotfiles/bash/prompt_old.sh
source $HOME/dotfiles/tmux/tmuxinator.bash

export PYTHONSTARTUP=$HOME/.pythonrc
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export CLICOLOR=1
export TERM=screen-256color
#TERM=xterm-256color
#export $TERM

export EDITOR=nvim

# vertical bar cursor
#echo -e -n "\x1b[\x35 q"

source $HOME/dotfiles/bash/settings.sh
source $HOME/dotfiles/bash/aliases.sh

