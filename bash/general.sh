#!/bin/bash

# Mac settings
if [[ $(uname) == "Darwin" ]]; then
    source $HOME/dotfiles/bash/macos.sh
# Linux settings
elif [ $(uname) == "Linux" ]; then
    source $HOME/dotfiles/bash/linux.sh
fi

# ls
colorflag="--color"
export LSCOLORS='di=5;1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#GxFxCxDxBxegedabagGcGb
# di = directory
# fi = file
# ln = symlinks
# pi = fifo file (?)
# so = socket file
# bd = block (buffered)
# cd = character (unbuffered)
# or = orphan symlink (points to inexistent file)
# mi = non-existent file pointed to by a symlink
# ex = file which is executable (chmod -x)

alias ls="ls -a ${colorflag}" #ls plus colors and dotfiles
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# fzf
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
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
alias edvimrc='v ~/.vimrc'
if [[ $EDITOR == 'nvim' ]]; then
  alias v='/usr/local/bin/nvim'
else
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

source $HOME/dotfiles/bash/path.sh

# pi
alias sshpi='ssh pi@192.168.1.100'
alias sshfspi_ext='sshfs pi@192.168.1.100:/home/pi/mnt'

