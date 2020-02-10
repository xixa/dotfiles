"
"    marcio ikematsu
"    marcio.ikematsu@usp.br
"

let mapleader=","

" GENERAL CONFIG
source ~/dotfiles/vim/config.vim
source ~/dotfiles/vim/layout.vim
source ~/dotfiles/vim/folds.vim
source ~/dotfiles/vim/plugins.vim
source ~/dotfiles/vim/xixa/mappings.vim
source ~/dotfiles/vim/syntax/svg.vim

" RECOGNIZE FILETYPES
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
au BufRead,BufNewFile *.svelte set filetype=svelte
" au BufRead,BufNewFile *.svelte set syntax=html filetype svelte

" LANGUAGE SPECIFIC CONFIG
autocmd FileType clojure source ~/dotfiles/vim/xixa/languages/lisp.vim
autocmd FileType typescript.tsx,typescriptreact,javascript.jsx,javascriptreact source ~/dotfiles/vim/xixa/languages/react.vim

" packadd! matchit

" auto completion
" filetype plugin on
" set complete=.,w,b,u,t,i,kspell
" set omnifunc=syntaxcomplete#Complete
" set completeopt=menu,menuone,preview,noselect,noinsert
"" enter inserts the option from a list instead of breaking a line
" set completeopt+=noinsert

"------------------------------------------- P L U G I N S
call plug#begin('~/.vim/plugged')

" stuff that really vIMPROVES vim.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring' "allows for different commentstrings to be placed in different parts of the code (e.g. jsx)
Plug 'tpope/vim-unimpaired'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

"repl-like stuff
Plug 'jpalardy/vim-slime'
Plug 'metakirby5/codi.vim'

" finding/jumping to places
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'wincent/loupe'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-projectionist'

" with ack
Plug 'mileszs/ack.vim'

" ui
Plug 'Yggdroot/indentLine'
Plug 'bling/vim-bufferline'

" INTEGRATION
" with unix
Plug 'tpope/vim-eunuch'

" with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'


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
      \'do': function('BuildComposer') }

Plug 'junegunn/goyo.vim', { 'for': 'text' }

call plug#end()

"auto-source virmc
" autocmd! BufWritePost $MYVIMRC so %
" nnoremap <silent> ,s :so $MYVIMRC<CR>:e<CR>

" auto save hidden buffers!
filetype plugin indent on
