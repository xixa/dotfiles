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

 COLOR_ARRAY[0]="${YELLOW}"
 COLOR_ARRAY[1]="${GREEN}"
 COLOR_ARRAY[2]="${LIGHT_BLUE}"
 COLOR_ARRAY[3]="${DARK_BLUE}"
 COLOR_ARRAY[4]="${PURPLE}"
 COLOR_ARRAY[5]="${PURPLE}"

# theme: ascii
#COLOR_ARRAY[0]="${LIME}"
#COLOR_ARRAY[1]="\e[0;31m"
#COLOR_ARRAY[2]="\e[0;35m"
#COLOR_ARRAY[3]="\e[0;95m"
#COLOR_ARRAY[4]="\e[0;96m"
#COLOR_ARRAY[5]="\e[0;96m"
##http://misc.flogisoft.com/bash/tip_colors_and_formatting

#venv
# export VIRTUAL_ENV_DISABLE_PROMPT=1
# function virtualenv_info(){
#     # Get Virtual Env
#     if [[ -n "$VIRTUAL_ENV" ]]; then
#         # Strip out the path and just leave the env name
#         __PS1_SUFFIX="($(basename "$VIRTUAL_ENV")) $__PS1_SUFFIX"
#         # venv="${VIRTUAL_ENV##*/}";
#     else
#         # In case you don't have one activated
#         venv=''
#     fi
#     [[ -n "$venv" ]] && echo "$venv${RESET} is ";
# }

I=0
# VENV_PS1="${COLOR_ARRAY[I++]}$(virtualenv_info)"
USER_PS1="${COLOR_ARRAY[I++]}\u${RESET}"
HOST_PS1="${COLOR_ARRAY[I++]}$(scutil --get LocalHostName)${RESET}"
PATH_PS1="${COLOR_ARRAY[I++]}\w${RESET}"

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
VIOLET='\[\033[01;35m\]'

function color_my_prompt {
  local __user_and_host="$GREEN\u@\h"
  local __cur_location="$BLUE\W"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$GREEN"
  local __prompt_tail="$VIOLET$"
  local __user_input_color="$GREEN"
  local __git_branch='$(__git_ps1)';

  # colour branch name depending on state
  if [[ "$(__git_ps1)" =~ "*" ]]; then     # if repository is dirty
      __git_branch_color="$RED"
  elif [[ "$(__git_ps1)" =~ "$" ]]; then   # if there is something stashed
      __git_branch_color="$YELLOW"
  elif [[ "$(__git_ps1)" =~ "%" ]]; then   # if there are only untracked files
      __git_branch_color="$LIGHT_GRAY"
  elif [[ "$(__git_ps1)" =~ "+" ]]; then   # if there are staged files
      __git_branch_color="$CYAN"
  fi

  # Build the PS1 (Prompt String)
  # PS1="$__user_and_host $__cur_location$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

# # git prompt
# if [ -f ~/.git-prompt.sh ]; then
#   source ~/.git-prompt.sh #loads git-prompt
#   GIT_PS1_HIDE_IF_PWD_IGNORED=true #do nothing if dir is .gitignored
#   GIT_PS1_SHOWUNTRACKEDFILES=true
#   GIT_PS1_SHOWDIRTYSTATE=true
#   GIT_PS1_SHOWUPSTREAM="git"
#   GIT_PS1_DESCRIBE_STYLE="contains"
#   GIT_PS1_SHOWCOLORHINTS=true

#   # GIT_PS1='$(__git_ps1 "on %s")'
#   # GIT_PS1='$(__git_ps1 "on ${COLOR_ARRAY[I++]}%s${RESET}")'
#   # GIT_PS1_STATESEPARATOR=" ${RESET}"
# fi

#http://www.fileformat.info/info/unicode/block/geometric_shapes/list.htm
PROMPT_SYMBOL_PS1="\n↳ " # ↪⇢⌥⇉✂ ☎ ☏ ☕ ☞ ☛ | ☠ ☭ ♂ ⚡ ϟ | ♘ ♞ | ♖ ♜ | ♔ ♚ | ♕ ♛ | ♙ ♟ | ♫ ♻ ♺ ⚓ ✎ ✏ ✐ ✑ ↪ ▸ ▹ ► ▻ Ⓧ ⎈ ⧔ ⧕ ⧫ ⬤ ●

# this var executes a command before bash display the prompt
# PROMPT_COMMAND="$VENV_PS1"
# PS1="$VENV_PS1$USER_PS1 at $HOST_PS1 in $PATH_PS1 $GIT_PS1 $PROMPT_SYMBOL_PS1"
# export PROMPT_COMMAND='
#   __PS1_SUFFIX="\\\$ "
#   if [[ -n "$VIRTUAL_ENV" ]]; then
#     __PS1_SUFFIX="($(basename "$VIRTUAL_ENV")) $__PS1_SUFFIX"
#   fi
#   __git_ps1 "\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\n$__PS1_SUFFIX"
# '
export PROMPT_COMMAND='
  __PS1_SUFFIX="\\\$ "
  if [[ -n "$VIRTUAL_ENV" ]]; then
    __PS1_SUFFIX="($(basename "$VIRTUAL_ENV")) as "
  fi
  __git_ps1 "$__PS1_SUFFIX$USER_PS1 at $HOST_PS1 in $PATH_PS1" "$PROMPT_SYMBOL_PS1 "
'
