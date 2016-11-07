"
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"
"    with snippets of code stolen from:
"       * joshua hogendorn
"       * nikolay frantsev
"

syntax on
set t_Co=256
hi clear
color vice
"set background=dark
"hi Normal ctermbg=none
"set encoding=utf-8
set guifont=Monaco:h14
set timeoutlen=1000 ttimeoutlen=0         " pensa rapido!
let mapleader=","
set backspace=2                           " so backspace works normally on tmux

"set cursorline                           " highlights the current line
set cursorcolumn                          " highlights cursor column
set number
set relativenumber                        " show line numbers relative to position
"setlocal foldmethod=syntax

" macVim settings
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
"set guicursor=n-v-c:block-Cursor
"set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
"set guicursor+=i:blinkwait10

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
  set cursorline
  set nocursorcolumn
  :noh
  hi statusline ctermfg=197 guifg=#ff005f ctermbg=0
endfunction


" status line
set ruler                                         " display info on the right bottom
set showmode
set laststatus=2                                  " shows status bar (
                                                  " 0=never, 1=if 2+ windows, 2=always)
set statusline=%f                                 " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
"set statusline+=%{&ff}]                          " file format
"set statusline+=%y                               " filetype
"set statusline+=%h                               " help file flag
set statusline+=%m                                " modified flag
"set statusline+=%r                               " read only flag
set statusline+=\ %=                              " align left
set statusline+=行%l/%L"[%p%%]                    " line X of Y [percent of file]
set statusline+=\ \ 列%c                          " current column
set statusline+=\ \ ◼\ %n\                        " Buffer number
"set statusline+=\ [%b][0x%B]\                    " ASCII and byte code under cursor

" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" tabs & indentation
filetype plugin indent on
let tabsize=2
autocmd filetype python let tabsize=4
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

" search
set ignorecase                                    " ignore case when search
set smartcase                                     " ignore case when the query is lowercase
set wildmenu                                      " bash-like auto-completion
set incsearch                                     " show search matches
set hlsearch

" behavior
set visualbell                                    " prevents buzz
set nowrap                                        " don't wrap lines
set mouse=a                                       " enables mouse
set clipboard=unnamed                             " OS clipboard
set autoread                                      " auto-reloads files changed outside vi
set showmatch                                     " shows matching parenthesis
set scrolloff=12                                  " n lines margin when scrolling

" behind the scenes
set noswapfile
set nobackup
set nowb

" auto completion
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setloca omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""""
"  keys bindings  "
"""""""""""""""""""

" adds/remove lines above/below (if empty) from normal mode
"nmap <silent><C-j> o<Esc>
"nmap <silent><C-k> O<Esc>
"nmap <silent><A-j> :set paste<Return>m`o<Esc>``:set nopaste<Return>
"nmap <silent><A-k> :set paste<Return>m`O<Esc>``:set nopaste<Return>
imap <silent><C-l> <right>

" vim/nvim specific
if has('nvim')
  " deoplete
  let g:deoplete#enable_at_startup = 1
else
  " neocomplete
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif

  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  " inoremap <expr><C-g>     neocomplete#undo_completion()
  " inoremap <expr><C-l>     neocomplete#complete_common_string()
  "
  " " Recommended key-mappings.
  " " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  endfunction

  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  
  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
  
  " Enable omni completion.

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^.
  "   \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
  "   *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
  "   *\t]\%(\.\|->\)\|\h\w*::'
  
  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif

" popupmenu-keys config
"function! OmniPopup(action)
    "if pumvisible()
        "if a:action == 'j'
            "return "\<C-N>"
        "elseif a:action == 'k'
            "return "\<C-P>"
        "endif
    "endif
    "return a:action
"endfunction

"inoremap <silent><c-j> <C-R>=OmniPopup('j')<CR>
"inoremap <silent><c-k> <C-R>=OmniPopup('k')<CR>


" PLUGINS

" NERDTree, NERDCommenter
noremap <C-\> :NERDTreeToggle<Return>
map <plug>NERDCommenterToggle(n, Toggle)

" fzf
noremap <C-t> :FZF<Return>
"noremap <C-t> :Files<Return>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore-dir=bin --ignore-dir="*.pyc"'

"ack vimrc
"the silver searcher in place of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <leader>a :tab split<Return>:Ack ""<Left>
nmap <leader>A :Ack <C-r><C-w><Return>
let g:ackhighlight = 1
let g:ackpreview = 1
"let g:ack_autoclose = 1
"let g:ack_autofold_results = 1

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']

" Emmet
let g:user_emmet_settings = {'javascript' : { 'extends':'jsx',}}

" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsJumpForwardTrigger= '<tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'

"Goyo
autocmd FileType markdown call s:goyo_enter()
let g:goyo_linenr=1
let g:goyo_width=80

function! s:goyo_enter()
  SoftPencil
  set noshowmode
  set noshowcmd
  set noruler
  set nocursorcolumn
  set nocursorline
  set nonumber
  set norelativenumber
  set spell spelllang=en_us
  autocmd! InsertEnter
  autocmd! InsertLeave
  autocmd! BufWritePost
endfunction

function! s:goyo_leave()
  set nospell
  autocmd InsertEnter * call MyInsertMode()
  autocmd InsertLeave * call MyNormalMode()
  autocmd BufWritePost ~/.vimrc so %
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Vim Markdown
let g:vim_markdown_folding_disabled = 1

" PLUGGED

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
"Plug 'nvie/vim-flake8'
Plug 'sirver/ultisnips'
"Plug 'valloric/youcompleteme'
Plug 'shougo/neocomplete.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bling/vim-bufferline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

"python
Plug 'mitsuhiko/vim-python-combined'

"javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'

"react shit
Plug 'mxw/vim-jsx'            " syntax highlighter
Plug 'justinj/vim-react-snippets'

"vim for writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

"auto-source virmc
autocmd! BufWritePost ~/.vimrc so %
