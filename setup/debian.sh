#!/bin/bash
# install drivers for geforce (https://wiki.debian.org/NvidiaGraphicsDrivers)
# adds line to /etc/apt/sources.list
"deb http://deb.debian.org/debian/ buster main contrib non-free"

apt update

apt install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') nvidia-driver

apt-get update
apt-get install -y\
  cmake\
  curl\
  pkg-config\
  libfreetype6-dev\
  libfontconfig1-dev\
  libxcb-xfixes0-dev\
  guake\
  tmux\
  nvim\
  fzf\
  silversearcher-ag\
  ripgrep\
  mpv\
  transmission-daemon

# installs linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
curl -sL https://deb.nodesource.com/setup_13.x | bash -

apt-get install -y\
  nodejs\
  erlang\
  elixir\

brew install \
  yarn\

# elixir
# installs hex
mix local.hex


# installs rust + cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y

# source so new path takes effect
~/.profile

# install rust apps
cargo install cargo-deb
cargo deb --install -p alacritty
