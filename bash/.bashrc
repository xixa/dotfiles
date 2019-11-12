source ~/dotfiles/bash/.bash_profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
