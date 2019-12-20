#!/bin/bash

alias srcit='source $HOME/.bashrc'
alias edbash='$EDITOR $HOME/dotfiles/bash/.bash_profile'
alias edalias='$EDITOR $HOME/dotfiles/bash/aliases.sh'

alias ipl='ifconfig en0 | grep inet | grep -v inet6 | awk "{print \$2}"'

# ls
colorflag="--color"
export LSCOLORS='di=5;1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
#GxFxCxDxBxegedabagGcGb
# di = directory
# fi = file
# ln = symlinks
# pi = fifo file (?)
# so = socket file
# bd = block (buffered)
# cd = character (unbuffered)
# or = orphan symlink (points to inexistent file)
# mi = non-existent file pointed to by a symlink
# ex = file which is executable (chmod -x)
alias ls="ls -a ${colorflag}" #ls plus colors and dotfiles
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

#mkdir
alias mkdir='mkdir -p' #forces mkdir to create intermediate directories if a path is specified

# tmux
alias edtmux='$EDITOR ~/.tmux.conf'
function sk {
  tmux send-keys -t bottom-right $@ Enter
}

# vim/nvim
alias edvimrc='$EDITOR ~/.vimrc'

# pi
alias sshpi='ssh pi@192.168.1.100'
alias sshfspi_ext='sshfs pi@192.168.1.100:/home/pi/mnt'

#git
alias git='LANG=en_US git'
alias glog='git log --oneline'

#docker
alias dockill="docker rm -f \$(docker ps -aq)"
alias dockup='docker-compose up -d'
alias dcomp='docker-compose'
alias dockip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias dockimgclean="docker rmi -f \$(docker images -f dangling=true -q)"

#kubernetes
alias k8="kubectl"

# npm
alias ng='npm list -g --depth=0 2>/dev/null' # lists packages globally, only the first level and throw stderr to the black hole
alias nl='npm list --depth=0 2>/dev/null' # same, but locally

alias youtube-dl='youtube-dl -o "~/Movies/youtube-dl/%(title)s.%(ext)s"'

# boilerplate
alias bpyarn="yarn add -D eslint babel-eslint eslint-config-prettier eslint-plugin-prettier jest prettier"
alias bpeslint="ln -s $HOME/dotfiles/rc/.eslintrc.json ."
alias bpjs='bpyarn; bpeslint'
