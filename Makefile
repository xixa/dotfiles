MY_DIR := $(realpath ./)
# MY_OS := $(shell uname)
MY_OS=$(shell uname)
# IS_MAC := $(if [[ $(uname-v) == *Darwin* ]]; then "true"; else "false"; fi)

# feedback
GREEN=\x1b[32;01m
RED=\x1b[31;01m
NO_COLOR=\x1b[0m

define output_result
	@echo "$(GREEN)$(1)$(NO_COLOR) ✓\n"
endef

install:
	@if [[ $(MY_OS) == Darwin ]]; then\
		./setup/mac.sh;\
	elif [[ $(MY_OS) == Linux ]]; then\
		./setup/debian.sh;\
	fi

ruby-install:
	./setup/rvm.sh
	./setup/gens.sh

symlinks:
	./setup/symlinks.sh

iterm-shell-integration:
	curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash &&\
		source ~/.iterm2_shell_integration.bash

# dev
tmux-setup:
	./setup/tmux.sh

vim-setup:
	./setup/vim.sh

linters:
	npm install --global\
		prettier\
		stylelint\
		stylelint-config-recommended\
		stylelint-config-css-modules

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

.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
