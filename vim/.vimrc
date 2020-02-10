"
"    marcio ikematsu
"    marcio.ikematsu@usp.br
"

let mapleader=","

" GENERAL CONFIG
source ~/dotfiles/vim/config.vim

source ~/dotfiles/vim/layout.vim

source ~/dotfiles/vim/mappings.vim

source ~/dotfiles/vim/folds.vim

source ~/dotfiles/vim/plugins.vim

"------------------------------------------- L A N G U A G E S
" RECOGNIZE FILETYPES
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
au BufRead,BufNewFile *.svelte set filetype=svelte
" au BufRead,BufNewFile *.svelte set syntax=html filetype svelte

" LANGUAGE SPECIFIC CONFIG
autocmd FileType clojure source ~/dotfiles/vim/layout-lisp.vim
autocmd FileType typescript.tsx,typescriptreact,javascript.jsx,javascriptreact source ~/dotfiles/vim/layout-react.vim

packadd! matchit

" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" behind the scenes
set noswapfile
set nobackup
set nowb

" auto completion
" filetype plugin on
" set complete=.,w,b,u,t,i,kspell
" set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,menuone,preview,noselect,noinsert
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


"------------------------------------------- P L U G I N S

call plug#begin('~/.vim/plugged')

"------------------------------------------- VIM++
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-eunuch'

Plug 'wincent/loupe'
Plug 'Yggdroot/indentLine'

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
Plug 'scrooloose/nerdtree'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" snippets
Plug 'SirVer/ultisnips'

"deoplete
" Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} "{{{
"  let g:deoplete#enable_at_startup = 1
"  " don't load deoplete with these files:
"  autocmd FileType text call deoplete#custom#buffer_option('auto_complete', v:false)

"Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

"------------------------------------------- INTEGRATION
" with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" with fzf, silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'

"------------------------------------------- LANGUAGES

Plug 'autozimu/LanguageClient-neovim', {'for': ['python'], 'branch': 'next', 'do': 'bash install.sh'}
Plug 'dense-analysis/ale', { 'for': [ 'json', 'svelte', 'elixir']}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['css', 'typescript.tsx']}


" LISPs
Plug 'kovisoft/paredit', { 'for': ['scheme', 'clojure'] }
" clojure
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" elixir
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elixir-lsp/elixir-ls', {'for': ['elixir'], 'do': 'mix deps.get && mix compile && mix elixir_ls.release -o release'}

" python
" Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
" Plug 'nvie/vim-flake8', { 'for': ['python'] }
" Plug 'davidhalter/jedi', { 'for': 'python' }
" Plug 'deoplete-plugins/deoplete-jedi'

" javascript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }

" react
Plug 'peitalin/vim-jsx-typescript', { 'for': [ 'javascript.jsx', 'typescript.tsx'] }
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript.tsx' }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript.jsx', 'typescript.tsx'] }
Plug 'alampros/vim-styled-jsx', { 'for': ['javascript.jsx', 'typescript.tsx'] }

" html
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim', {'for': ['html', 'eelixir', 'svelte', 'typescript', 'typescript.tsx']}

"graphql
Plug 'jparise/vim-graphql', { 'for': ['graphql'] }

"vim for writing
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

Plug 'euclio/vim-markdown-composer', {
      \'for': 'markdown',
      \'do': function('BuildComposer') } "{{{
  let g:vim_markdown_folding_disabled = 1
"}}}

Plug 'junegunn/goyo.vim', { 'for': 'text' }

call plug#end()

"auto-source virmc
autocmd! BufWritePost $MYVIMRC so %
nnoremap <silent> ,s :so $MYVIMRC<CR>:e<CR>

autocmd BufNewFile,BufRead * :call mappings#langserver()

source ~/dotfiles/vim/syntax/svg.vim

" auto save hidden buffers!
:set hidden
filetype plugin indent on
