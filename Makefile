MY_DIR := $(realpath ./)
MY_OS := $(shell uname)

install: bash tmux vim rc

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
bash: .bash_profile .bashrc

.bash_profile: $(MY_DIR)/bash/.bash_profile
	@echo -ne 'creates .bash_profile symlink at the root: '
	ln -s $(MY_DIR)/bash/.bash_profile ~
	@echo ✓

.bashrc: $(MY_DIR)/bash/.bashrc
	@echo -ne 'creates .bashrc symlink at the root: '
	ln -s $(MY_DIR)/bash/.bashrc ~
	@echo ✓

# tmux
tmux: .tmux.conf

.tmux.conf: $(MY_DIR)/tmux/.tmux.conf
	@echo -ne 'creates .tmux.conf symlink at the root: '
	ln -s $(MY_DIR)/tmux/.tmux.conf ~
	@echo ✓

# vim & neovim
NEOVIM := ~/.config/nvim
vim: .vimrc init.vim my_snippets

.vimrc: $(MY_DIR)/vim/.vimrc
	@echo -ne 'creates .vimrc symlink at the root: '
	ln -s $(MY_DIR)/vim/.vimrc ~
	@echo ✓

init.vim: $(MY_DIR)/vim/.vimrc
	@echo -ne 'creates .vimrc symlink at neovim folder as init.vim: '
	ln -s $(MY_DIR)/vim/.vimrc $(NEOVIM)/init.vim
	@echo ✓

my_snippets: $(MY_DIR)/vim/my_snippets
	@echo -ne 'creates a symlink for my snippets collection for neovim: '
	ln -s $(MY_DIR)/vim/my_snippets $(NEOVIM)/my_snippets
	@echo ✓

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
	rm ~/.eslintrc.json
	rm ~/.gemrc
	rm ~/.inputrc

.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
