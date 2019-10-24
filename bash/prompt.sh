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
if [ -e .git-prompt.sh ]; then
  source .git-prompt.sh #loads git-prompt
  GIT_PS1_HIDE_IF_PWD_IGNORED=true #do nothing if dir is .gitignored
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUPSTREAM="git"
  GIT_PS1_DESCRIBE_STYLE="contains"
  GIT_PS1_SHOWCOLORHINTS=true
fi;

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
    [[ -n "$venv" ]] && echo "($venv) ";
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

# VENV="\$(virtualenv_info)";

#prompt
PS1="\n\n$VENV\w  $__git_ps1 \n$ "
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;
