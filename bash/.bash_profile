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

export LC_ALL=en_US.UTF-8

source $HOME/dotfiles/bash/prompt.sh
source $HOME/dotfiles/tmux/tmuxinator.bash

#PATH
if [[ $(uname) == "Darwin" ]]; then
  export PATH=$PATH
# Linux settings
elif [ $(uname) == "Linux" ]; then
  export PATH=$PATH
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export CLICOLOR=1
export TERM=screen-256color
#TERM=xterm-256color
#export $TERM

export EDITOR=nvim
export MYVIMRC="~/.vimrc"

# Python
export PYTHONSTARTUP=$HOME/.pythonrc
export PATH=$PATH:/usr/local/bin/python3
# alias python=/usr/local/bin/python3

# Ruby
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# vertical bar cursor
#echo -e -n "\x1b[\x35 q"

source $HOME/dotfiles/bash/settings.sh
source $HOME/dotfiles/bash/aliases.sh
