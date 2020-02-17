syntax on
language en_US

colorscheme agatheo

set timeoutlen=1000 ttimeoutlen=0                 " pensa rapido!
set backspace=2                                   " so backspace works normally on tmux
set cursorcolumn                                  " highlights cursor column
set number                                        " show current line number
set relativenumber                                " show line numbers relative to position
set cmdheight=1

" search
set ignorecase                                    " ignore case when search
set smartcase                                     " ignore case when the query is lowercase
set wildmenu                                      " bash-like auto-completion
set incsearch                                     " show search matches
set hlsearch

" behavior
set visualbell                                    " prevents buzz
"set nowrap                                        " don't wrap lines
set mouse=a                                       " enables mouse
set clipboard=unnamed                             " OS clipboard
set autoread                                      " auto-reloads files changed outside vi
autocmd FocusGained * silent! checktime
set showmatch                                     " shows matching parenthesis
set scrolloff=12                                  " n lines margin when scrolling

"tabs & indentation
let tabsize=2
let &tabstop=tabsize                              " tab = 2 spaces
let &shiftwidth=tabsize                           " spaces used by autoindeting
let &softtabstop=tabsize                          " backspace remove tabs
set autoindent
set cindent
set smarttab                                      " behaves according to context
set smartindent                                   "
set expandtab                                     " converts tabs into spaces
retab
set tw=79
set wrap linebreak nolist                         " soft line breaking
set formatoptions-=t

set splitbelow
set splitright

" behind the scenes
set noswapfile
set nobackup
set nowb

" tmux termguicolor
" (has to go after colorscheme is set)
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" providers
" let g:python3_host_prog='/usr/local/bin/python3'
" let g:loaded_python3_provider=1
