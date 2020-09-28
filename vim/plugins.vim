"PLUGINS CONFIG
function! plugins#pluginsConfig()

  if &runtimepath =~ "ack.vim"
    "the silver searcher in place of ack
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
    if executable('rg')
      let g:ackprg = 'rg --vimgrep'
    endif
    let g:ackhighlight = 1
    let g:ackpreview = 1
    "let g:ack_autoclose = 1
    "let g:ack_autofold_results = 1
  endif

  if &runtimepath =~ "ale"
    let g:ale_completion_enabled = 0
    let g:ale_fix_on_save = 1
    let g:ale_linter_aliases = {
         \ 'svelte': ['css', 'javascript'],
         \ 'javascriptreact': ['javascript', 'javascript.tsx'],
         \ 'typescriptreact': ['typescript', 'typescript.tsx'],
         \ }
    let g:ale_fixers = {
         \ '*': ['trim_whitespace'],
         \ 'json': ['prettier'],
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
  endif


  if &runtimepath =~ "auto-pairs"
   let g:AutoPairsFlyMode = 0
  endif

  if &runtimepath =~ "coc.nvim"
    "coc-prettier
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " visual
    hi! CocErrorSign ctermfg=218 ctermbg=NONE guifg=#ffffff guibg=#000000
  endif

  if &runtimepath =~ "deoplete"
    let g:deoplete#enable_at_startup = 1
    " don't load deoplete with these files:
    autocmd FileType text call deoplete#custom#buffer_option('auto_complete', v:false)
   endif


  if &runtimepath =~ "emmet-vim"
  endif

  if &runtimepath =~ "fzf.vim"
    let $FZF_DEFAULT_COMMAND = 'ag -g ""
          \ --ignore-dir={
          \bin,
          \"*.pyc",
          \"*.lock",
          \"*.woff",
          \"*.mp4","*.webm",
          \"*.jpg","*.jpeg","*.gif","*.png"
          \}'
    set rtp+=/usr/local/opt/fzf
    let g:fzf_buffers_jump = 1
    " preview with bat
    " command! -bang -nargs=? -complete=dir Files
    " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
    " preview normal
    command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  endif

  if &runtimepath =~ "goyo"
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
  endif


  if &runtimepath =~ "indentLine"
    let g:indentLine_fileTypeExclude=['help', 'text', 'json']
    let g:indentLine_char = "│" "│ ⎸['|', '¦', '┆', '┊']
  endif

  if &runtimepath =~ "NERDTree"
    " ignore stuff
    let g:NERDTreeShowHidden=1
    let g:NERDTreeIgnore=['node_modules', '.DS_Store']

    " C changes directory and root directory
    let g:NERDTreeChDirMode=2

    " Removes help message
    let g:NERDTreeMinimalUI=1

    " opens NERDTree on vim startup if no file is specified
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " closes Vim if NERDTree is the only window open
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  endif

  if &runtimepath =~ "LanguageClient"
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
  endif

  " if &runtimepath =~ "vim-slime"
  "   let g:slime_target = "tmux"
  "   let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.3"}
  " endif

      " \     'components/*.tsx': {
      " \       'alternate': '__tests__/components/{}.test.tsx',
      " \       'type': 'source'
      " \     },
      " \     '__tests__/components/*.test.tsx': {
      " \       'alternate': 'components/{}.tsx',
      " \       'type': 'test'
      " \     },
      " \     'pages/*.tsx': {
      " \       'alternate': [
      " \         '__tests__/pages/{}.test.tsx',
      " \       ],
      " \       'type': 'source'
      " \     },
      " \     '__tests__/pages/*.test.tsx': {
      " \       'alternate': [
      " \         'pages/{}.tsx',
      " \       ],
      " \       'type': 'test'

  if &runtimepath =~ "vim-projectionist"
    let g:projectionist_heuristics = {
      \   '*': {
      \     'components/*.tsx': {
      \       'alternate': 'stylesheets/components/{}.module.scss',
      \       'type': 'source'
      \     },
      \     'stylesheets/components/*.module.scss': {
      \       'alternate': 'components/{}.tsx',
      \       'type': 'style'
      \     },
      \     'pages/**/*.tsx': {
      \       'alternate': [
      \         'pages/**/{}.module.scss',
      \       ],
      \       'type': 'source'
      \     },
      \     'pages/**/*.module.scss': {
      \       'alternate': [
      \         'pages/**/{}.tsx',
      \       ],
      \       'type': 'style'
      \     },
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
      \       'type': 'test'
      \     }
      \   }
      \ }
  endif

  if &runtimepath =~ "vim-surround"
    " swaps ASCII chars for surrounds
    " (you can find the ASCII code with :echo char2nr("<symbol>"))
    " % or 37
    autocmd FileType elixir let b:surround_37 = "%{ \r }"

    " <, > or 60, 62
    autocmd FileType typescript,typescript.tsx let b:surround_60 = "< \r >"
    autocmd FileType typescript,typescript.tsx let b:surround_62 = "< \r >"
  endif

  if &runtimepath =~ "nvim-treesitter"
    " lua require"treesitter"
  endif

  if &runtimepath =~ "UltiSnips"
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsSnippetDirectories=["~/dotfiles/vim/my_snippets"]
    let g:UltiSnipsEditSplit='vertical'
  endif

  if &runtimepath =~ "gimoji-selector"
    nmap <Leader>j "=system('gitmoji-selector')"<c-m>P
  endif
endfunction

autocmd BufEnter,BufNewFile,BufRead * :call plugins#pluginsConfig()
