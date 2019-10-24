MY_DIR := $(realpath ./)

install: bash tmux vim rc

new:
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# bash
bash: .bashrc

.bashrc: $(MY_DIR)/bash/.bashrc
	ln -s $(MY_DIR)/bash/.bashrc ~

# tmux
tmux: .tmux.conf

.tmux.conf: $(MY_DIR)/tmux/.tmux.conf
	ln -s $(MY_DIR)/tmux/.tmux.conf ~

# vim & neovim
NEOVIM := ~/.config/nvim
vim: .vimrc init.vim my_snippets

.vimrc: $(MY_DIR)/vim/.vimrc
	ln -s $(MY_DIR)/vim/.vimrc ~

init.vim: $(MY_DIR)/vim/.vimrc
	ln -s $(MY_DIR)/vim/.vimrc $(NEOVIM)/init.vim

my_snippets: $(MY_DIR)/vim/my_snippets
	ln -s $(MY_DIR)/vim/my_snippets $(NEOVIM)/my_snippets

# rc files
rc: .eslintrc.json

.eslintrc.json: $(MY_DIR)/rc/.eslintrc.json
	ln -s $(MY_DIR)/rc/.eslintrc.json ~

clean:
	rm ~/.bashrc || true;
	rm ~/.tmux.conf || true;
	rm ~/.vimrc || true;
	rm ~/.config/nvim/init.vim || true;
	rm ~/.config/nvim/my_snippets || true;
	rm ~/.eslintrc.json

#TODO
# - installs Neovim
# - installs homebrew
# 	- installs homebrew apps
#
