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
"set background=dark
"set encoding=utf-8
set guifont=Monaco:h14
set timeout timeoutlen=1000 ttimeoutlen=0         " pensa rapido!
let mapleader=","
set backspace=2                           " so backspace works normally on tmux

set ruler                                 " display info on the right bottom
"set cursorline                           " highlights the current line
set cursorcolumn                          " highlights cursor column
set relativenumber                        " show line numbers relative to position

"toggle cursor in normal/insert mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" macVim settings
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" modes
autocmd InsertEnter * call MyInsertMode()
autocmd InsertLeave * call MyNormalMode()

function! MyNormalMode()
  set relativenumber
  set cursorcolumn
  set nocursorline
  hi statusline ctermfg=7 guifg=#c0c0c0 ctermbg=0
endfunction

function! MyInsertMode()
  set number
  set nohls
  set cursorline
  set nocursorcolumn
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
set scrolloff=8                                   " n lines margin when scrolling

" behind the scenes
set noswapfile
set nobackup
set nowb

" keys
" adds/remove lines above/below (if empty) from normal mode
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<Return>``:noh<Return>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<Return>``:noh<Return>
nnoremap <silent><A-j> :set paste<Return>m`o<Esc>``:set nopaste<Return>
nnoremap <silent><A-k> :set paste<Return>m`O<Esc>``:set nopaste<Return>

noremap <C-n> :NERDTreeToggle<Return>
noremap <C-t> :Files<Return>
noremap <C-t> :FZF<Return>

map <plug>NERDCommenterToggle(n, Toggle)

let g:syntastic_javascript_checkers = ['eslint']
" treats javascript as jsx, for react thingies
let g:user_emmet_settings = {'javascript' : { 'extends':'jsx',}}
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsJumpForwardTrigger= '<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
"
" vim specific
if has('nvim')
"  tnoremap <C-[> <C-\><C-n>     " normal mode from nvim term
endif

call plug#begin('~/.vim/plugged')

Plug 'http://github.com/scrooloose/syntastic'
Plug 'http://github.com/scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'http://github.com/scrooloose/nerdcommenter'
Plug 'http://github.com/tpope/vim-surround'
Plug 'http://github.com/mattn/emmet-vim'
Plug 'http://github.com/junegunn/fzf.git', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'http://github.com/nvie/vim-flake8'
Plug 'http://github.com/sirver/ultisnips'
"Plug 'http://github.com/valloric/youcompleteme'
"Plug 'http://github.com/shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'http://github.com/bling/vim-bufferline'
Plug 'http://github.com/christoomey/vim-tmux-navigator'

"react shit
Plug 'http://github.com/mxw/vim-jsx'            " syntax highlighter
Plug 'http://github.com/justinj/vim-react-snippets'

call plug#end()

autocmd! bufwritepost ~/.vimrc source %           " auto-source
