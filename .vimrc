"
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"
"    with snippets of code stolen from:
"       * joshua hogendorn
"       *

" ▁▁▁ ┃╭╮╭╮┃╭╯ ▁▁▁
" ▔▔▔ ┗╰╯╰╯┣┻╮ ▔▔▔

syntax on
set t_Co=256
color vice
"set encoding=utf-8


" ▁▁▁ ┓╮╭╮┃┃╭╮┃┃╳╭╮╭╮ ▁▁▁
" ▔▔▔ ┃┫┣┛┣┫┣┫┗╯┃╰╯┃   ▔▔▔
"       ┻╯╰╯

" visual
set ruler                                       " display info on the right bottom
"set showmode                                    " always show the current mode
set showcmd
set cursorline                                  " highlights the current line

set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

" status line
set laststatus=2                " shows status bar (0=never, 1=when, 2=always)

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=DeepPink2 ctermfg=197 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"Formats the statusline
set statusline=%f                                 " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
"set statusline+=%{&ff}]                          " file format
"set statusline+=%y                               " filetype
"set statusline+=%h                               " help file flag
set statusline+=%m                                " modified flag
"set statusline+=%r                               " read only flag
set statusline+=\ %=                              " align left
set statusline+=line:%l/%L[%p%%]                  " line X of Y [percent of file]
set statusline+=\ col:%c                          " current column
set statusline+=\ buffer:%n                       " Buffer number
"set statusline+=\ [%b][0x%B]\                    " ASCII and byte code under cursor


" buffers
highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" tabs & indentation
filetype plugin indent on
set autoindent
set cindent
let tabsize = 2
autocmd filetype python let tabsize=4
let &tabstop=tabsize                              " tab = 2 spaces
let &shiftwidth=tabsize                           " spaces used by autoindeting
let &softtabstop=tabsize                          " backspace remove tabs
set expandtab                                     " converts tabs into spaces
set smarttab                                      " 
set smartindent                                   "

" search
set ignorecase                                    " ignore case when searching
set smartcase                                     " ignore case when the query is lowercase
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

" nvim specific
if has('nvim')
"  tnoremap <C-[> <C-\><C-n>     " normal mode from nvim term
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvie/vim-flake8'

call plug#end()
