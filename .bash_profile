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

set -o vi
source $HOME/.bash_prompt
source $HOME/dotfiles/tmux/tmuxinator.bash
export PYTHONSTARTUP=$HOME/.pythonrc
eval "$(rbenv init -)"

TERM=screen-256color
export EDITOR=vim

echo -e -n "\x1b[\x35 q"

# Mac settings
if [ "$(uname)" == "Darwin" ]; then
    source ~/dotfiles/osx/.osx
# Linux settings
elif [ "$(uname)" == "Linux" ]; then
    echo "gotta add linux stuffzies yet"
fi

# meta
alias srcit='source $HOME/.bash_profile'
alias edbash='v $HOME/.bash_profile'
alias edvimrc='v $HOME/.vimrc'

# ls
colorflag="-G"
export LSCOLORS=GeFxCxDxBxegedabagGcGb
alias ls="ls -a ${colorflag}" #ls plus colors and dotfiles
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# cdfile: cd to the a given file's directory
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}


# mk
alias mkdir='mkdir -p' #forces mkdir to create intermediate directories if a path is specified

# cat
# syntax highlighting (requires Pygments installed)
if [ "command -v pygmentize" != "" ]; then
  alias c='pygmentize -O style=monokai -f console256 -g'
fi

# tree
if [ "command -v tree" != "" ]; then
  #ignores .gitignore file extensions
  alias tree='tree -a -I $(cat ~/dotfiles/.gitignore | grep -v "^#.*$|^[[:space:]]*$" | tr "\\n" "|" | sed "s/.$//")'
fi

# npm
alias ng='npm list -g --depth=0 2>/dev/null' # lists packages globally, only the first level and throw stderr to the black hole
alias nl='npm list --depth=0 2>/dev/null' # same, but locally

# vim/nvim
if [ "command -v nvim" != "" ]; then
  #alias v='/usr/local/bin/nvim'
  alias v='/usr/local/bin/vim'
fi

# atom
if [ "command -v atom" != "" ]; then
  alias a='/usr/local/bin/atom'

  # touch & atom (creates a file and opens it in atom)
  ta()
  {
    touch $1;
    a $1;
  }
fi

# sublime text
if [ "command -v s" != "" ]; then
  # touch & sublime (creates a file and opens it in sublime text)
  ts()
  {
      touch $1;
      s $1;
  }
fi


export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH:$HOME/bin"
# export PYTHONSTARTUP=$HOME/xixa.py #runs a script when an interactive interpreter session starts
