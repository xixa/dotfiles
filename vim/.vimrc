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

" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" behind the scenes
set noswapfile
set nobackup
set nowb

" auto completion
filetype plugin on
set complete=.,w,b,u,t,i,kspell
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,preview,noselect,noinsert
"" enter inserts the option from a list instead of breaking a line
" set completeopt+=noinsert

fun! <sid>striptrailingwhitespaces()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l,c)
endfun

autocmd BufWritePre * :call <sid>striptrailingwhitespaces()

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

"------------------------------------------- L A N G U A G E S
" recognize files
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
" au BufRead,BufNewFile *.svelte set syntax=html filetype svelte


"------------------------------------------- P L U G I N S

call plug#begin('~/.vim/plugged')

"------------------------------------------- VIM++
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'bling/vim-bufferline'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs' "{{{
  au FileType clojure let b:autopairs_loaded=1
"}}}
Plug 'jpalardy/vim-slime' "{{{
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.3"}
"}}}
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/nerdtree' "{{{
  noremap <C-\> :NERDTreeToggle<CR>
"}}} , { 'on': 'NERDTreeToggle' }

" snippets
Plug 'SirVer/ultisnips' "{{{
  let g:UltiSnipsUsePythonVersion = 3
  let g:UltiSnipsSnippetDirectories=["~/dotfiles/vim/my_snippets"]
  let g:UltiSnipsJumpForwardTrigger= "<Tab>"
  " let g:UltiSnipsListSnippets='<c-tab>'
  let g:UltiSnipsJumpBackwardTrigger='<S-tab>'
  let g:UltiSnipsEditSplit='vertical'
"}}}

" deoplete
" Plug 'shougo/deoplete.nvim' "{{{
"  let g:deoplete#enable_at_startup = 1
"  let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/ternjs'
"  let g:deoplete#sources#ternjs#docs = 1
"  let g:deoplete#sources#ternjs#omit_object_prototype = 0
""}}}, { 'do': ':UpdateRemotePlugins' }
"Plug 'shougo/neco-vim'

"------------------------------------------- INTEGRATION
" with git
Plug 'tpope/vim-fugitive'

" with fzf, silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "{{{
  " changes focus if nerdtree is open
  nnoremap <silent> <expr> <C-t> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

  " noremap <C-t> :Files<CR>
  let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore-dir=bin --ignore-dir="*.pyc"'
  set rtp+=/usr/local/opt/fzf
"}}}

" with ack, silver searcher
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

"------------------------------------------- LANGUAGES
Plug 'sheerun/vim-polyglot' "{{{
  " let g:polyglot_disabled = ['svelte']
"}}}

Plug 'dense-analysis/ale' "{{{
  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
        \ 'javascript': ['eslint', 'prettier'],
        \ 'jsx': ['eslint'],
        \ 'typescript': ['tslint', 'eslint'],
        \ 'elixir': ['mix_format'],
        \ 'svelte': ['eslint'],
        \}
  let g:ale_linters = {
        \ 'javascript': ['eslint'],
        \ 'jsx': ['eslint'],
        \ 'typescript': ['tslint', 'tsserver'],
        \ 'elixir': ['elixir-ls'],
        \ 'svelte': ['eslint'],
        \}
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  highlight ALEErrorSign ctermbg=NONE cterm=bold ctermfg=160 ctermbg=235 gui=bold guifg=#e0211d
  highlight ALEWarningSign ctermbg=NONE cterm=bold ctermfg=100 ctermbg=235 gui=bold guifg=#ffdb58
  let g:ale_elixir_elixir_ls_release=$HOME . '/.vim/plugged/elixir-ls/rel'
  let g:ale_typescript_tsserver_executable=$HOME . '/.vim/plugged/javascript-typescript-langserver/lib'
  nnoremap <silent> K :ALEHover <CR>
  nnoremap <silent> ,d :ALEGoToDefinitionInSplit <CR>
"}}}

Plug 'prettier/vim-prettier' "{{{
  let g:prettier#config#semi = 'false'
  let g:prettier#config#single_quote = 'false'
  let g:prettier#config#bracket_spacing = 'true'
  nnoremap <silent> ,p :Prettier <CR>
"}}}, {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

"python
Plug 'mitsuhiko/vim-python-combined'
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi'
" Plug 'deoplete-plugins/deoplete-jedi'

"clojure
Plug 'tpope/vim-fireplace'
Plug 'kovisoft/paredit' "{{{
  let g:paredit_electric_return=0
"}}}
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'clojure-vim/async-clj-omni'

"elixir
Plug 'elixir-editors/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'JakeBecker/elixir-ls', {'do': 'mix deps.get && mix compile && mix elixir_ls.release -o rel'}

"graphql
Plug 'jparise/vim-graphql'

"javascript
" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'neomake/neomake'
" Plug 'digitaltoad/vim-pug'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sourcegraph/javascript-typescript-langserver', { 'do': 'npm install && npm run watch' }

" front-end stuff
Plug 'mattn/emmet-vim' "{{{
  let g:user_emmet_settings = {'javascript' : { 'extends':'jsx',}}
"}}}

"react shit
Plug 'mxw/vim-jsx'            " syntax highlighter
Plug 'justinj/vim-react-snippets'
Plug 'styled-components/vim-styled-components'

"html5
Plug 'othree/html5.vim'

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

"auto-source virmc
autocmd! BufWritePost ~/.vimrc so %

source ~/dotfiles/vim/syntax/svg.vim

"auto save hidden buffers!
:set hidden
filetype plugin indent on
