"
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"

filetype plugin indent on
syntax on

"       ::::::::::::::::::::::::: LOOKS ::::::::::::::::::::::::
set t_Co=256
colorscheme monokai

"       :::::::::::::::::::: GENERAL CONFIG ::::::::::::::::::::
" visual
set laststatus=2            " shows status bar (0=never, 1=when, 2=always)
set ruler                   " display info on the right bottom
set showmode                " always show the current mode
autocmd InsertEnter * :set number               " absolute in insert
autocmd InsertLeave * :set relativenumber       " relative in normal mode

" tabs & indentation
set autoindent
autocmd filetype python set ts=4 sw=4 sts=4
autocmd filetype javascript set ts=2 sw=2 sts=2 
set expandtab               " converts tabs into spaces
set smarttab
set smartindent

" behavior
set nowrap                  " don't wrap lines
set visualbell              " prevents buzz
set wildmenu                " bash-like auto-completion
set wildmode=list:full      "
set ignorecase              " ignore case when searching set smartcase               " ignore case when the query is lowercase
set incsearch  
set nowrap
set hlsearch                " highlight searches
set incsearch               " show search matches
set mouse=a                 " enables mouse
set clipboard=unnamed       " OS clipboard
set autoread                " auto-reloads files changed outside vi
set showcmd
set cursorline              " highlights the current line
set showmatch               " shows matching parenthesis
set scrolloff=4             " 4 lines margin when scrolling

" behind the schenes
set noswapfile
set nobackup
set nowb

"         :::::::::::::::::::: VUNDLE + plugins :::::::::::::::::
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
