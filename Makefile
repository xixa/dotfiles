MY_DIR := $(realpath ./)
MY_OS := $(shell uname)

# feedback
GREEN=\x1b[32;01m
RED=\x1b[31;01m
NO_COLOR=\x1b[0m

define output_result
	@echo "$(GREEN)$(1)$(NO_COLOR) ✓\n"
endef

install: bash tmux vim rc base-apps config

# necessary apps
base-apps: xcode ruby brew brew-apps brew-cask

xcode:
	xcode-select --install

ruby: rvm gems

rvm:
ifeq ($(MY_OS), Darwin)
	gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB;
	\curl -sSL https://get.rvm.io | bash;
	source ~/.rvm/scripts/rvm;
	rvm install ruby --latest
else
	@echo do something for linux
endif

gems:
	gems install rake

brew:
	yes "" | /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; brew tap caskroom/cask

brew-apps:
	brew install\
		coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep\
		bash-completion\
		python3\
		tree\
		make\
		ack\
		fzf\
		node\
		yarn\
		youtube-dl\
		tmux\
		tmuxinator\
		neovim\
		jq

brew-cask:
	brew cask install\
		docker\
		firefox\
		google-chrome\
		google-chrome-canary\
		flux\
		iterm2\
		hammerspoon\
		vlc\
		transmission\
		keka\
		postman\
		nvalt

# bash
bash: .bash_profile .bashrc iterm_shell_integration

.bash_profile: $(MY_DIR)/bash/.bash_profile
	ln -s $(MY_DIR)/bash/.bash_profile ~
	$(call output_result,Symlink to .bash_profile created!)

.bashrc: $(MY_DIR)/bash/.bashrc
	ln -s $(MY_DIR)/bash/.bashrc ~
	$(call output_result,Symlink to .bashrc created!)

iterm-shell-integration:
	curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash &&\
		source ~/.iterm2_shell_integration.bash

# tmux
tmux: .tmux.conf tpm

.tmux.conf: $(MY_DIR)/tmux/.tmux.conf
	ln -s $(MY_DIR)/tmux/.tmux.conf ~
	$(call output_result,Symlink to .tmux.conf created!)

tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim & neovim
NEOVIM := ~/.config/nvim
vim: .vimrc init.vim my_snippets vimplugins

.vimrc: $(MY_DIR)/vim/.vimrc
	ln -s $(MY_DIR)/vim/.vimrc ~
	$(call output_result,Symlink to .vimrc created!)

init.vim: $(MY_DIR)/vim/.vimrc
	ln -s $(MY_DIR)/vim/.vimrc $(NEOVIM)/init.vim
	$(call output_result,Symlink to init.vim created!)

my_snippets: $(MY_DIR)/vim/my_snippets
	ln -s $(MY_DIR)/vim/my_snippets $(NEOVIM)/my_snippets
	$(call output_result,Symlink to snippets directory created!)

vimplugins:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
		nvim +PlugInstall +UpdateRemotePlugins +qa
		# nvim -c ':PlugInstall' -c 'qa!'

# rc files
rc: .inputrc .eslintrc.json .gemrc

.inputrc: $(MY_DIR)/rc/.inputrc
	@echo -ne 'creates .inputrc symlink at the root: '
	ln -s $(MY_DIR)/rc/.inputrc ~
	@echo ✓

.eslintrc.json: $(MY_DIR)/rc/.eslintrc.json
	@echo -ne 'creates .eslintrc.json symlink at the root: '
	ln -s $(MY_DIR)/rc/.eslintrc.json ~
	@echo ✓

.gemrc: $(MY_DIR)/rc/.gemrc
	@echo -ne 'creates .gemrc symlink at the root: '
	ln -s $(MY_DIR)/rc/.gemrc ~
	@echo ✓

clean:
	rm ~/.bash_profile || true;
	rm ~/.bashrc || true;
	rm ~/.tmux.conf || true;
	rm ~/.vimrc || true;
	rm ~/.config/nvim/init.vim || true;
	rm ~/.config/nvim/my_snippets || true;
	rm ~/.eslintrc.json;
	rm ~/.gemrc;
	rm ~/.inputrc
	$(call output_result,All dotfiles removed!)

config:
	defaults write -g ApplePressAndHoldEnabled -bool false;
	defaults write com.apple.finder AppleShowAllFiles true;
	defaults write com.apple.screencapture type PNG;
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true;
	mkdir ~/Documents/screenshots;
	defaults write com.apple.screencapture location "~/Documents/screenshots";
	defaults write com.apple.finder CreateDesktop false;
	defaults write -g WebAutomaticTextReplacementEnabled -bool true;

.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
