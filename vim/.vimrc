"
"    marcio ikematsu
"    marcio.ikematsu@usp.br
"

let mapleader=","

source ~/dotfiles/vim/config.vim

source ~/dotfiles/vim/layout.vim

source ~/dotfiles/vim/mappings.vim

source ~/dotfiles/vim/folds.vim

packadd! matchit

"jsx stuff
autocmd FileType typescript.tsx setlocal commentstring={/*\ %s\ */}
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" buffers
"highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor
set splitbelow
set splitright

" behind the scenes
set noswapfile
set nobackup
set nowb

" Background colors for active vs inactive windows
hi ActiveWindow guibg=#17252c
" hi InactiveWindow guibg=#0D1B22
hi InactiveWindow guibg=#333333
hi PreviewWindow guibg=#000000

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:PreviewWindow
  else
    setlocal winhighlight=Normal:WarningMsg,NormalNC:InactiveWindow
    setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endif
endfunction


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

"projectionist
let g:projectionist_heuristics = {
      \   '*': {
      \     'lib/*.ex': {
      \       'alternate': [
      \         'test/{}_test.exs',
      \       ],
      \       'type': 'source'
      \     },
      \     'test/*_test.exs': {
      \       'alternate': [
      \         'lib/{}.ex',
      \       ],
      \     }
      \   }
      \ }

"------------------------------------------- L A N G U A G E S
" recognize files
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex set filetype=eelixir
au BufRead,BufNewFile *.svelte set filetype=svelte
" au BufRead,BufNewFile *.svelte set syntax=html filetype svelte

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
Plug 'Yggdroot/indentLine' "{{{
  let g:indentLine_fileTypeExclude=['help', 'text', 'json']
  let g:indentLine_char = "│" "│ ⎸['|', '¦', '┆', '┊']
" }}}

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
  noremap <c-\> :NERDTreeToggle<cr>
  " C changes directory and root directory
  let g:NERDTreeChDirMode = 2
  " open NERDTree on vim startup if no file is specified
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " closes Vim if NERDTree is the only window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}} , { 'on': 'NERDTreeToggle' }
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

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
" Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'} "{{{
"  let g:deoplete#enable_at_startup = 1
"  " don't load deoplete with these files:
"  autocmd FileType text call deoplete#custom#buffer_option('auto_complete', v:false)

"------------------------------------------- INTEGRATION
" with git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" with fzf, silver searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' "{{{
  " changes focus to main window if NERDTree is open
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
  " nmap <leader>a :tab split<CR>:Ack! ""<Left>
  nnoremap <Leader>a :Ack!<Space>
  " nmap <leader>A :Ack! <C-r><C-w><CR>
  let g:ackhighlight = 1
  let g:ackpreview = 1
  "let g:ack_autoclose = 1
  "let g:ack_autofold_results = 1
"}}}

"------------------------------------------- LANGUAGES

Plug 'autozimu/LanguageClient-neovim', {
      \ 'for': ['python'],
      \ 'branch': 'next',
      \ 'do': 'bash install.sh'
      \ }
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_serverCommands = {
        \ 'javascript': ['/usr/local/bin/javascript-typescript-langserver'],
        \ 'typescript.tsx': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'python': ['/usr/local/bin/pyls']
        \}
  let g:LanguageClient_useFloatingHover=1
  let g:LanguageClient_hoverPreview='Always'
  let g:LanguageClient_diagnosticsDisplay={
        \ 1: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
        \ 2: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
        \ 3: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
        \ 4: {'signTexthl': 'LineNr', 'virtualTexthl': 'User8'},
        \ }
  let g:LanguageClient_rootMarkers={
        \ 'typescript': ['tsconfig.json', 'package.json'],
        \ 'typescript.tsx': ['tsconfig.json', 'package.json'],
        \ }

  let g:LanguageClient_diagnosticsList='Location'

Plug 'dense-analysis/ale', { 'for': [ 'json', 'svelte', 'elixir'], 'do': function('mappings#langserver') } "{{{
  let g:ale_completion_enabled = 0
  let g:ale_fix_on_save = 1
  let g:ale_linter_aliases = {
       \ 'svelte': ['css', 'javascript'],
       \ 'javascriptreact': ['javascript', 'javascript.tsx'],
       \ 'typescriptreact': ['typescript', 'typescript.tsx'],
       \ }
  let g:ale_fixers = {
       \ '*': ['trim_whitespace'],
       \ 'json': ['fixjson'],
       \ 'css': ['prettier'],
       \ 'javascript': ['eslint', 'prettier'],
       \ 'typescript': ['tslint', 'eslint', 'prettier'],
       \ 'typescript.tsx': ['tslint','prettier'],
       \ 'elixir': ['mix_format'],
       \ 'svelte': ['eslint', 'prettier'],
       \ 'python': ['black'],
       \ }
  let g:ale_linters = {
        \'css': ['stylelint'],
       \ 'javascript': ['eslint', 'tsserver'],
       \ 'typescript': ['tsserver'],
       \ 'typescript.tsx': ['tsserver', 'eslint'],
       \ 'elixir': ['elixir-ls'],
       \ 'svelte': ['eslint'],
       \ 'python': ['pyls'],
       \ }
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  let g:ale_list_window_size = 5
  let g:ale_set_balloons=1
  "errors
  " let g:ale_cursor_detail=1 "show on preview if cursor on top
  highlight ALEErrorSign ctermbg=NONE cterm=bold ctermfg=160 ctermbg=235 gui=bold guifg=#e0211d
  highlight ALEWarningSign ctermbg=NONE cterm=bold ctermfg=100 ctermbg=235 gui=bold guifg=#ffdb58
  let g:ale_elixir_elixir_ls_release=$HOME . '/.vim/plugged/elixir-ls/release'
  let g:ale_python_auto_pipenv=1
  let g:ale_completion_tsserver_autoimport = 1
  " nnoremap <silent> <leader>e :ALEDetail <CR>
  " nnoremap <silent> <leader>p :ALEFix <CR>
"}}}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['css', 'typescript.tsx']}
command! -nargs=0 Prettier :CocCommand prettier.formatFile
hi! CocErrorSign guifg=#ffe2d6
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" LISPs
Plug 'kovisoft/paredit', { 'for': 'clojure' } "{{{
  let g:paredit_electric_return=0
"}}}

" clojure
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
" Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
" Plug 'clojure-vim/async-clj-omni', { 'for': 'clojure' }

" elixir
Plug 'elixir-editors/vim-elixir', { 'for': ['elixir'] }
" Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elixir-lsp/elixir-ls', {
      \'for': ['elixir'],
      \'do': 'mix deps.get && mix compile && mix elixir_ls.release -o release'
      \}


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
Plug 'mattn/emmet-vim', {'for': ['html', 'eelixir', 'svelte', 'typescript', 'typescript.tsx']} "{{{
  let g:user_emmet_settings = {'javascript' : { 'extends':'javascript.jsx'}}
"}}}

" graphql
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

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set nocursorline
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd! User goyo.vim echom 'Goyo is now loaded!'

call plug#end()

"auto-source virmc
autocmd! BufWritePost $MYVIMRC so %
nnoremap <silent> ,s :so $MYVIMRC<CR>:e<CR>

autocmd BufNewFile,BufRead * :call mappings#langserver()

source ~/dotfiles/vim/syntax/svg.vim

" auto save hidden buffers!
:set hidden
filetype plugin indent on
