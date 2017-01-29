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

PINK="$(tput setaf 198)"
RED="$(tput setaf 9)"
ORANGE="$(tput setaf 214)"
LIME="$(tput setaf 154)"
GREEN="$(tput setaf 118)"
CYAN="$(tput setaf 39)"
YELLOW=$(tput setaf 220)
LIGHT_BLUE="$(tput setaf 45)"
MEDIUM_BLUE="$(tput setaf 39)"
DARK_BLUE="$(tput setaf 33)"
PURPLE="$(tput setaf 135)"
GREY="$(tput setaf 248)"
RESET="$(tput sgr0)"

#################
### MY PROMPT ###
#################
# theme: blue sky

 COLOR_ARRAY[0]="${LIME}"
 COLOR_ARRAY[1]="${GREEN}"
 COLOR_ARRAY[2]="${LIGHT_BLUE}" 
 COLOR_ARRAY[3]="${MEDIUM_BLUE}"
 COLOR_ARRAY[4]="${DARK_BLUE}"
 COLOR_ARRAY[5]="${PURPLE}"

# theme: ascii
#COLOR_ARRAY[0]="${LIME}" 
#COLOR_ARRAY[1]="\e[0;31m"
#COLOR_ARRAY[2]="\e[0;35m"
#COLOR_ARRAY[3]="\e[0;95m"
#COLOR_ARRAY[4]="\e[0;96m"
#COLOR_ARRAY[5]="\e[0;96m"
##http://misc.flogisoft.com/bash/tip_colors_and_formatting

I=0

# virtualenvwrapper settings
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs #virtual environments folder
  export PROJECT_HOME=$HOME/Projects/web/ # projects folder
  source /usr/local/bin/virtualenvwrapper.sh #location of the script TODO: add this to dotfile
  # export VIRTUAL_ENV_DISABLE_PROMPT=1 # disables virtualenv in the prompt
fi

VENV_PS1="${COLOR_ARRAY[I++]}"
USER_PS1="${COLOR_ARRAY[I++]}\u${RESET}"
HOST_PS1="${COLOR_ARRAY[I++]}$(scutil --get LocalHostName)${RESET}"
PATH_PS1="${COLOR_ARRAY[I++]}\w${RESET}"

# git prompt
if [ -e .git-prompt.sh ]; then
  source .git-prompt.sh #loads git-prompt
  GIT_PS1_HIDE_IF_PWD_IGNORED=true #do nothing if dir is .gitignored
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUPSTREAM="git"
  GIT_PS1_DESCRIBE_STYLE="contains"
  GIT_PS1_SHOWCOLORHINTS=true
  
  GITPROMPT_PS1='$(__git_ps1 "on ${COLOR_ARRAY[I++]}%s${RESET}")'
  GIT_PS1_STATESEPARATOR=" ${RESET}"
fi

#http://www.fileformat.info/info/unicode/block/geometric_shapes/list.htm
PROMPT_SYMBOL_PS1="\n↳ " # ↪⇢⌥⇉✂ ☎ ☏ ☕ ☞ ☛ | ☠ ☭ ♂ ⚡ ϟ | ♘ ♞ | ♖ ♜ | ♔ ♚ | ♕ ♛ | ♙ ♟ | ♫ ♻ ♺ ⚓ ✎ ✏ ✐ ✑ ↪ ▸ ▹ ► ▻ Ⓧ ⎈ ⧔ ⧕ ⧫ ⬤ ●

# this var executes a command before bash display the prompt
#PROMPT_COMMAND="echo -n [$(date +%H%M)]"

PS1="$USER_PS1 at $HOST_PS1 in $PATH_PS1 $GITPROMPT_PS1 $PROMPT_SYMBOL_PS1"
