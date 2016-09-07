"
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"
"    with snippets of code stolen from:
"       * joshua hogendorn
"       *

syntax on
set t_Co=256
color vice
"set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0         " pensa rapido!

set ruler                                 " display info on the right bottom
"set showmode                             " always show the current mode
set cursorline                            " highlights the current line
set cursorcolumn                          " highlights cursor column
set relativenumber                        " show line numbers relative to position

" modes
autocmd InsertEnter * call MyInsertMode()
autocmd InsertLeave * call MyNormalMode()

function! MyNormalMode()
  hi statusline ctermfg=7 guifg=#c0c0c0 ctermbg=0
endfunction

function! MyInsertMode()
  :set number
  :set nohls
  hi statusline ctermfg=197 guifg=#ff005f ctermbg=0
endfunction


" status line
set laststatus=2                " shows status bar (0=never, 1=when, 2=always)
set statusline=%f                                 " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
"set statusline+=%{&ff}]                          " file format
"set statusline+=%y                               " filetype
"set statusline+=%h                               " help file flag
set statusline+=%m                                " modified flag
"set statusline+=%r                               " read only flag
set statusline+=\ %=                              " align left
set statusline+=行%l/%L"[%p%%]                  " line X of Y [percent of file]
set statusline+=\ \ 列%c                          " current column
set statusline+=\ \ ◼\ %n\                      " Buffer number
"set statusline+=\ [%b][0x%B]\                    " ASCII and byte code under cursor


" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" tabs & indentation
filetype plugin indent on
set autoindent
set cindent
let tabsize=2
autocmd filetype python let tabsize=4
let &tabstop=tabsize                              " tab = 2 spaces
let &shiftwidth=tabsize                           " spaces used by autoindeting
let &softtabstop=tabsize                          " backspace remove tabs
set expandtab                                     " converts tabs into spaces
set smarttab                                      " 
set smartindent                                   "
set tw=80

" search
set ignorecase                                    " ignore case when searching
set smartcase                                     " ignore case when the query is lowercase dfsf dsfsdfdsfsdafdsfdsfdsfdsf
set wildmenu                                      " bash-like auto-completion
set incsearch                                     " incremental search
"set hlsearch                                     " highlight searches
"set incsearch                                    " show search matches

" behavior
set visualbell                                    " prevents buzz
set nowrap                                        " don't wrap lines
set mouse=a                                       " enables mouse
set clipboard=unnamed                             " OS clipboard
set autoread                                      " auto-reloads files changed outside vi
set showmatch                                     " shows matching parenthesis
set scrolloff=8                                   " 4 lines margin when scrolling

" behind the scenes
set noswapfile
set nobackup
set nowb

" shortcuts
noremap <C-n> :NERDTreeToggle<Return>
noremap <C-t> :Files<Return>
noremap <C-\> :NERDComToggleComment<Return>

let g:deoplete#enable_at_startup = 1

" nvim specific
if has('nvim')
"  tnoremap <C-[> <C-\><C-n>     " normal mode from nvim term
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvie/vim-flake8'
Plug 'sirver/ultisnips'
"Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'bling/vim-bufferline'

call plug#end()
