MY_DIR := $(realpath ./)

install: init.vim .eslintrc.json

new:
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# neovim
init.vim: $(MY_DIR)/.vimrc
	ln -s $(MY_DIR)/.vimrc ~/.config/nvim/init.vim

.eslintrc.json: $(MY_DIR)/linters/.eslintrc.json
	ln -s $(MY_DIR)/linters/.eslintrc.json ~

clean:
	rm ~/.config/nvim/init.vim || true;
	rm ~/.eslintrc.json
