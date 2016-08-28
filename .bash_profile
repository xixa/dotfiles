##############################
### marcio ikematsu        ###
### marcio.ikematsu@usp.br ###
##############################

#################
### VARIABLES ###
#################

TERM=xterm-256color
PINK="$(tput setaf 198)"
RED="$(tput setaf 9)"
ORANGE="$(tput setaf 214)"
YELLOW="$(tput setaf 154)"
GREEN="$(tput setaf 118)"
CYAN="$(tput setaf 39)"
LIGHT_BLUE="$(tput setaf 45)"
MEDIUM_BLUE="$(tput setaf 39)"
DARK_BLUE="$(tput setaf 33)"
PURPLE="$(tput setaf 135)"
GREY="$(tput setaf 248)"
RESET="$(tput sgr0)"

#############################
### 3rd PARTY STUFF SETUP ###
#############################

# virtualenvwrapper settings
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs #virtual environments folder
  export PROJECT_HOME=$HOME/Projects/web/ # projects folder
  source /usr/local/bin/virtualenvwrapper.sh #location of the script TODO: add this to dotfile
  # export VIRTUAL_ENV_DISABLE_PROMPT=1 # disables virtualenv in the prompt
fi


#################
### MY PROMPT ###
#################

# green to blue gradient pattern
VENV_PS1="${YELLOW}"
VENV_SYMBOL_PS1="●"
USER_PS1="${GREEN}\u${RESET}"
HOST_PS1="${LIGHT_BLUE}\h${RESET}"
PATH_PS1="${MEDIUM_BLUE}\w${RESET}"
# git prompt
if [ -e ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh #loads git-prompt
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GITPROMPT_PS1='$(__git_ps1 "on ${DARK_BLUE}%s${RESET}")'
fi

# colorful pattern
# VENV_PS1="${YELLOW}"
# VENV_SYMBOL_PS1="●"
# USER_PS1="${LIGHT_BLUE}\u${RESET}"
# HOST_PS1="${MEDIUM_BLUE}\h$${RESET}"
# PATH_PS1="${DARK_BLUE}\w${RESET}"
# GIT_PS1="$(__git_ps1 ${PINK}%s${RESET})"

PROMPT_SYMBOL_PS1="\n↪ " # ✂ ☎ ☏ ☕ ☞ ☛ | ☠ ☭ ♂ ⚡ ϟ | ♘ ♞ | ♖ ♜ | ♔ ♚ | ♕ ♛ | ♙ ♟ | ♫ ♻ ♺ ⚓ ✎ ✏ ✐ ✑ ↪ ▸ ▹ ► ▻ Ⓧ ⎈ ⧔ ⧕ ⧫ ⬤ ●

PS1="$USER_PS1 at $HOST_PS1 in $PATH_PS1 $GITPROMPT_PS1 $PROMPT_SYMBOL_PS1"
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

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
if [ "command -v pygmentize" != "" ]; then
  alias c='pygmentize -O style=monokai -f console256 -g' # color coding (requires Pygments installed)
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
