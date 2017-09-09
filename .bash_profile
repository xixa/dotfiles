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

source $HOME/dotfiles/bash/prompt.sh
source $HOME/dotfiles/tmux/tmuxinator.bash
export PYTHONSTARTUP=$HOME/.pythonrc
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
#eval "$(rbenv init -)"

export CLICOLOR=1
export TERM=screen-256color
#TERM=xterm-256color
#export $TERM

export EDITOR=nvim

# vertical bar cursor
#echo -e -n "\x1b[\x35 q"

alias srcit='source $HOME/.bash_profile'
alias edbash='v $HOME/.bash_profile'

source $HOME/dotfiles/bash/general.sh
