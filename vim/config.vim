syntax on
language en_US

colorscheme agatheo
set noemoji

set hidden
set bufhidden=hide
set autowrite                                 " gets rid of 'no write since last change'
" set conceallevel=0                            " prevents annoying auto hidden quotes in json files

set timeoutlen=400 ttimeoutlen=0              " pensa rapido!
set backspace=2                               " so backspace works normally on tmux

" search
set ignorecase                                " ignore case when search
set smartcase                                 " ignore case when the query is lowercase
set wildmenu                                  " bash-like auto-completion
set incsearch                                 " show search matches
set hlsearch

" behavior
set visualbell                                " prevents buzz
"set nowrap                                   " don't wrap lines
set mouse=a                                   " enables mouse
" set clipboard=unnamed                       " OS clipboard
set showmatch                                 " shows matching parenthesis
set scrolloff=12                              " n lines margin when scrolling

" auto-reload
set autoread                                  " auto-reloads files changed outside vi
autocmd FocusGained * silent! checktime

"tabs & indentation
let tabsize=2
let &tabstop=tabsize                          " tab = 2 spaces
let &shiftwidth=tabsize                       " spaces used by autoindeting
let &softtabstop=tabsize                      " backspace remove tabs
set autoindent
set cindent
set smarttab                                  " behaves according to context
set smartindent
set expandtab                                 " converts tabs into spaces
retab
set tw=79
set wrap linebreak nolist                     " soft line breaking
set formatoptions-=t

set splitbelow
set splitright

" behind the scenes
set noswapfile
set nobackup
set nowb

" tmux termguicolor
" (has to go after colorscheme is set)

set t_ut=                " fix 256 colors in tmux http://sunaku.github.io/vim-256color-bce.html

if has("termguicolors")  " set true colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
endif

" supposedly gives you italics. doesn't seem like it
" let &t_ZH="\<Esc>[3m"
" let &t_ZR="\<Esc>[23m"

" set t_ZH=^[[3m
" set t_ZR=^[[23m

" providers
let g:python_host_prog=''
let g:python3_host_prog='/usr/local/bin/python3'
" let g:python3_host_prog=system('which python')
" let g:python3_host_prog=system('/Users/xixa/.asdf/shims/python')

"fold starts open
" set foldlevelstart=20
