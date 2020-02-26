#!/bin/bash
#
# this script installs RVM on different systems
#

if [[ $(uname) == Darwin ]]; then
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB;
	\curl -sSL https://get.rvm.io | bash;
	source ~/.rvm/scripts/rvm;
	rvm install ruby --latest
elif [[ $(uname -v) == *Debian* ]]; then
	echo do something for linux
fi
