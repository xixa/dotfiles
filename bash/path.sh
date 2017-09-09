
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$HOME/bin"
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Mac settings
if [[ $(uname) == "Darwin" ]]; then
  export PATH="$PATH"
# Linux settings
elif [ $(uname) == "Linux" ]; then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
fi

export PYTHONSTARTUP=$HOME/xixa.py #runs a script when an interactive interpreter session starts



#export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH:$HOME/bin"
