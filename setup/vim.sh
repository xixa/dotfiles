#!/bin/bash
#
# This script setups vim/neovim just the way I like it <3
#

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
