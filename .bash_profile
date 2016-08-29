# ╱ ╱ ╱ ╱ ╱  ╱  ╱ ╱ ╱
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

source .bash_prompt

########################
### COMMANDS/ALIASES ###
########################

# Mac settings
if [ "$(uname)" == "Darwin" ]; then
  # sublime text
  alias s='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

  # finder
  alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

  # desktop
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

  # sound
  alias stfu="osascript -e 'set volume output muted true'"
  alias pumpitup="osascript -e 'set volume 7'"

  # system
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Linux settings
elif [ "$(uname)" == "Linux" ]; then
    echo "gotta add linux stuffzies yet"
fi

# meta
alias srcit='source ~/.bash_profile'
alias edbash='v ~/.bash_profile'
alias edvimrc='v ~/.vimrc'

# cat
# syntax highlighting (requires Pygments installed)
if [ "command -v pygmentize" != "" ]; then
  alias c='pygmentize -O style=monokai -f console256 -g'
fi

# vim/nvim
if [ "command -v nvim" != "" ]; then
  alias v='/usr/local/bin/nvim'
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

# ls
colorflag="-G"
export LSCOLORS=GeFxCxDxBxegedabagGcGb
alias ls="ls -a ${colorflag}" #ls plus colors and dotfiles
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# tree
if [ "command -v tree" != "" ]; then
  alias tree='tree -I *.pyc' #ignores some file extensions
fi

# mk
alias mkdir='mkdir -p' #forces mkdir to create intermediate directories if a path is specified


############
### PATH ###
############

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
# export PYTHONSTARTUP=$HOME/xixa.py #runs a script when an interactive interpreter session starts
