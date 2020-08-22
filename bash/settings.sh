#!/bin/bash

# bash completion
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Mac settings
if [[ $(uname) == "Darwin" ]]; then
    source $HOME/dotfiles/bash/macos.sh
# Linux settings
elif [ $(uname) == "Linux" ]; then
    source $HOME/dotfiles/bash/linux.sh
fi

. /usr/local/opt/asdf/asdf.sh
# fzf
if [[ "${CURR_SHELL}" == "bash"  ]]; then
  . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
  [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
elif [[ "${CURR_SHELL}" == "zsh"  ]]; then
  [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
fi

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# cdfile: cd to the a given file's directory
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

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

# vim/nvim
if [[ $EDITOR == 'nvim' ]]; then
  alias v='/usr/local/bin/nvim'
else
  alias v='/usr/local/bin/vim'
fi

source $HOME/dotfiles/bash/path.sh
