"
"    copyleft (Ↄ) marcio ikematsu
"    marcio.ikematsu@usp.br
"
"    with snippets of code stolen from:
"       * joshua hogendorn
"       * nikolay frantsev
"

let mapleader=","

source ~/dotfiles/vim/config.vim

source ~/dotfiles/vim/layout.vim

source ~/dotfiles/vim/mappings.vim

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

" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

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


fun! <sid>striptrailingwhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun

autocmd BufWritePre * :call <sid>striptrailingwhitespaces()

" providers
" let g:python3_host_prog='/usr/local/bin/python3'
" let g:loaded_python3_provider=1

" fzf
noremap <C-t> :FZF<CR>
"noremap <C-t> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore-dir=bin --ignore-dir="*.pyc"'
set rtp+=/usr/local/opt/fzf

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

" PLUGGED
call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale' "{{{
  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
        \ 'javascript': ['eslint', 'prettier'],
        \ 'jsx': ['eslint'],
        \ 'typescript': ['tslint'],
        \ 'elixir': ['mix_format'],
        \}
  let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'jsx': ['eslint'],
        \ 'typescript': ['tslint'],
        \ 'elixir': ['elixir-ls'],
        \}
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  highlight ALEErrorSign ctermbg=NONE ctermfg=red
  highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
  " let g:ale_elixir_elixir_ls_release='$HOME/.vim/plugged/elixir-ls/apps/elixir_ls_utils/priv'
  let g:ale_elixi_elixir_ls_release=$HOME . '.vim/plugged/elixir_ls/apps/elixir_ls_utils/priv'
"}}}

Plug 'prettier/vim-prettier' "{{{
  let g:prettier#config#semi = 'false'
  let g:prettier#config#single_quote = 'false'
  let g:prettier#config#bracket_spacing = 'true'
"}}}, {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

Plug 'scrooloose/nerdtree' "{{{
  noremap <C-\> :NERDTreeToggle<CR>
"}}} , { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim' "{{{
  let g:user_emmet_settings = {'javascript' : { 'extends':'jsx',}}
"}}}
Plug 'nvie/vim-flake8'

Plug 'SirVer/ultisnips' "{{{
  let g:UltiSnipsUsePythonVersion = 3
  let g:UltiSnipsSnippetDirectories=["~/dotfiles/vim/my_snippets"]
  let g:UltiSnipsJumpForwardTrigger= "<Tab>"
  " let g:UltiSnipsListSnippets='<c-tab>'
  let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
  let g:UltiSnipsEditSplit='vertical'
"}}}

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/neco-vim'
Plug 'bling/vim-bufferline'
Plug 'mileszs/ack.vim' "{{{
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
"}}}

Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs' "{{{
  au FileType clojure let b:autopairs_loaded=1
"}}}
Plug 'jpalardy/vim-slime' "{{{
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.3"}
"}}}
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
Plug 'kovisoft/paredit' "{{{
  let g:paredit_electric_return=0
"}}}
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'clojure-vim/async-clj-omni'

"elixir
" Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'JakeBecker/elixir-ls'
" Plug 'amiralies/coc-elixir'

"vim for writing
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

Plug 'euclio/vim-markdown-composer', "{{{
  let g:vim_markdown_folding_disabled = 1
"}}} { 'do': function('BuildComposer') }

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
