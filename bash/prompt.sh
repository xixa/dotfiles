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

# virtualenvwrapper settings
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs #virtual environments folder
  export PROJECT_HOME=$HOME/Projects/web/ # projects folder
  source /usr/local/bin/virtualenvwrapper.sh #location of the script TODO: add this to dotfile
  # export VIRTUAL_ENV_DISABLE_PROMPT=1 # disables virtualenv in the prompt
fi

# git prompt
if [ -e .git-prompt.sh ]; then
  source .git-prompt.sh #loads git-prompt
  GIT_PS1_HIDE_IF_PWD_IGNORED=true #do nothing if dir is .gitignored
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUPSTREAM="git"
  GIT_PS1_DESCRIBE_STYLE="contains"
  GIT_PS1_SHOWCOLORHINTS=true
fi

PS1="\n\n\w $__git_ps1\n$ "
export PS1

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
