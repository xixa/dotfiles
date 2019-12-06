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


LIME="$(tput setaf 154)"
GREEN="$(tput setaf 118)"

RESET="$(tput sgr0)"

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# git prompt
if [ -f ~/git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_DESCRIBE_STYLE="contains"
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/git-prompt.sh
fi

if [[ "$(__git_ps1)" =~ "*" ]]; then     # if repository is dirty
    __git_branch_color="GREEN"
elif [[ "$(__git_ps1)" =~ "$" ]]; then   # if there is something stashed
    __git_branch_color="$YELLOW"
elif [[ "$(__git_ps1)" =~ "%" ]]; then   # if there are only untracked files
    __git_branch_color="$LIGHT_GRAY"
elif [[ "$(__git_ps1)" =~ "+" ]]; then   # if there are staged files
    __git_branch_color="$CYAN"
fi

# venv
function virtualenv_info(){
  # Get Virtual Env
  if [[ -n "$VIRTUAL_ENV" ]]; then
      # Strip out the path and just leave the env name
      venv="${VIRTUAL_ENV##*/}";
  else
      # In case you don't have one activated
      venv=''
  fi
  [[ -n "$venv" ]] && echo "(${GREEN}venv on${RESET}) ";
}

VENV="\$(virtualenv_info)";

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

#prompt
PS1="${VENV}\w$(__git_ps1)\nλ "
export PS1;

# PS2="\[${yellow}\]→ \[${reset}\]";
# export PS2;
