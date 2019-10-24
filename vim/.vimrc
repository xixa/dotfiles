
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"
"    with snippets of code stolen from:
"       * joshua hogendorn
"       * nikolay frantsev
"
syntax on
language en_US
set t_Co=258
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
highlight Normal ctermbg=NONE
" hi clear
" let g:dracula_italic = 0
" colorscheme dracula
highlight Normal ctermbg=None
color agathe
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
" colorscheme solarized8
" highlight Normal cterm=NONE term=NONE
" highlight Normal ctermbg=NONE
set guifont=Monaco:h14
set timeoutlen=1000 ttimeoutlen=0         " pensa rapido!
let mapleader=","
set backspace=2                           " so backspace works normally on tmux
set cursorcolumn                          " highlights cursor column
set number
set relativenumber                        " show line numbers relative to position

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
  hi statusline ctermfg=197 guifg=#ff005f ctermbg=0
endfunction

" status line
set title
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

" behind the scenes
set noswapfile
set nobackup
set nowb

" auto completion
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete
"" enter inserts the option from a list instead of breaking a line
set completeopt+=noinsert

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
"nmap <silent><A-j> :set paste<Return>m`o<Esc>``:set nopaste<CR>
"nmap <silent><A-k> :set paste<Return>m`O<Esc>``:set nopaste<CR>
imap <silent><C-l> <right>
" nnoremap <CR>:noh<CR><CR>
" shift+tab to jump outside enclosing chars
imap <silent><S-Tab> <C-o>A

"make
nnoremap <leader>m :w<CR> :silent make\|redraw!\|cc<CR>
:command! Makenode :set makeprg=tmux\ send-key\ -t\ 1\ node\\\ %\ Enter
:command! Makejasmine :set makeprg=tmux\ send-key\ -t\ 1\ npm\\\ test\ Enter

"tabs & indentation
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
set formatoptions-=t

fun! <sid>striptrailingwhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun

autocmd BufWritePre * :call <sid>striptrailingwhitespaces()

" PLUGINS

" NERDTree, NERDCommenter
noremap <C-\> :NERDTreeToggle<CR>
" map <plug>NERDCommenterToggle(n, Toggle)

" fzf
noremap <C-t> :FZF<CR>
"noremap <C-t> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore-dir=bin --ignore-dir="*.pyc"'
set rtp+=/usr/local/opt/fzf

"ack vimrc
"the silver searcher in place of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nmap <leader>a :tab split<CR>:Ack ""<Left>
nmap <leader>A :Ack <C-r><C-w><CR>
let g:ackhighlight = 1
let g:ackpreview = 1
"let g:ack_autoclose = 1
"let g:ack_autofold_results = 1

" Syntastic
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_html_tidy_exec = 'tidy5'
" let g:syntastic_enable_signs   = 1
" let g:syntastic_error_symbol = '×'
" let g:syntastic_warning_symbol = '⎔'
" let g:syntastic_style_error_symbol = '×'
" let g:syntastic_style_warning_symbol = '×'
" let g:syntastic_html_tidy_ignore_errors = [
" \ "<poll-include-fragment> is not recognized!",
" \ "discarding unexpected <poll-include-fragment>",
" \ "discarding unexpected </poll-include-fragment>",
" \ "trimming empty <span>",
" \ "<svg> is not recognized!",
" \ "discarding unexpected <svg>",
" \ "discarding unexpected </svg>",
" \ "<a> escaping malformed URI reference",
" \ "plain text isn't allowed in <head> elements",
" \ "<li> isn't allowed in <body> elements",
" \ "inserting implicit <ul>",
" \ "missing </ul> before <div>",
" \ "trimming empty <li>",
" \ "trimming empty <ul>",
" \ "missing quote mark for attribute value",
" \ ]
" ctrl w E to find errors and ctrl w F to hide them
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR>
" nnoremap <C-w>F :SyntasticToggleMode<CR>

"Ale
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = ['eslint', 'prettier']
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"Prettier
" let g:prettier#config#semi = 'false'
" let g:prettier#config#single_quote = 'false'
" let g:prettier#config#bracket_spacing = 'true'

"Emmet
let g:user_emmet_settings = {'javascript' : { 'extends':'jsx',}}

" Auto-pairs
au FileType clojure let b:autopairs_loaded=1

" UltiSnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=["~/dotfiles/vim/my_snippets", "my_snippets"]
" let g:UltiSnipsSnippetsDir="~/xixa/dotfiles/vim/my_snippets"
" let g:UltiSnipsSnippetDirectories=["my_snippets"]
let g:UltiSnipsJumpForwardTrigger= "<Tab>"
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
let g:UltiSnipsEditSplit='vertical'

" Neosnippet
" let g:neosnippet#disable_runtime_snippets = 1
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/dotfiles/vim/my_snippets'

" Flow
let g:flow#autoclose = 1
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
let g:flow#flowpath = local_flow
endif

"Markdown
let g:vim_markdown_folding_disabled = 1

"Emacs
" Basic cursor movement and deletion keybindings from emacs, for vim.

" insert mode
" imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>

" command line mode
" cmap <C-p> <Up>
" cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

" command-T window
let g:CommandTCursorLeftMap  = ['<Left>',  '<C-b>']
let g:CommandTCursorRightMap = ['<Right>', '<C-f>']
let g:CommandTBackspaceMap   = ['<BS>',    '<C-h>']
let g:CommandTDeleteMap      = ['<Del>',   '<C-d>']

function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! s:split_line_text_at_cursor()
  let line_text = getline(line('.'))
  let text_after_cursor  = line_text[col('.')-1 :]
  let text_before_cursor = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before_cursor, text_after_cursor]
endfunction

" slime
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.3"}

" paredit
let g:paredit_electric_return=0

" PLUGGED
call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'yaml', 'html'] }
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/limelight.vim'
"Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'nvie/vim-flake8'
Plug 'sirver/ultisnips'
" Plug 'shougo/neocomplete.vim'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neco-vim'
" Plug 'Shougo/neosnippet'
Plug 'bling/vim-bufferline'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'jpalardy/vim-slime'
Plug 'metakirby5/codi.vim'

"looks
Plug 'tpope/vim-sensible'

"python
Plug 'mitsuhiko/vim-python-combined'
Plug 'davidhalter/jedi'
Plug 'deoplete-plugins/deoplete-jedi'

"javascript
" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'neomake/neomake'
" Plug 'digitaltoad/vim-pug'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" flow
" Plug 'flowtype/vim-flow', { 'autoload': { 'filetypes': 'javascript'}}
" Plug 'wokalski/autocomplete-flow'

"react shit
Plug 'mxw/vim-jsx'            " syntax highlighter
Plug 'justinj/vim-react-snippets'
Plug 'styled-components/vim-styled-components'

"graphql

Plug 'jparise/vim-graphql'

"html5
Plug 'othree/html5.vim'

"clojure
Plug 'tpope/vim-fireplace'
Plug 'kovisoft/paredit'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'clojure-vim/async-clj-omni'
" Plug 'eraserhd/parinfer-rust'
" Plug 'kovisoft/slimv'

"vim for writing
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Plug 'davinche/godown-vim'
" Plug 'suan/vim-instant-markdown'
" Plug 'junegunn/goyo.vim'
" Plug 'reedes/vim-pencil'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/ternjs'
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

"auto-source virmc
autocmd! BufWritePost ~/.vimrc so %

source ~/dotfiles/vim/syntax/svg.vim

"auto save hidden buffers!
:set hidden
filetype plugin indent on
