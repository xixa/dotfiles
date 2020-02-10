"nap
" nnoremap <silent> <leader>c :e <cfile><CR>
" map <silent> <leader>cf :call writefile([], expand("<cfile>"), "t")<cr>
map <silent> <leader>cf :!touch <c-r><c-p><cr><cr>
" inoremap <Nul> <C-x><C-o>
inoremap <Nul> <C-N>
"Be a little more like Emacs when on insert mode, will you?
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
inoremap <C-a> <esc>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>

" cycle between line number layouts
nnoremap <silent> <Leader>l :call mappings#cycle_numbering()<CR>

function! s:kill_line()
  let [text_before_cursor, text_after_cursor] = s:split_line_text_at_cursor()
  if len(text_after_cursor) == 0
    normal! J
  else
    call setline(line('.'), text_before_cursor)
  endif
  return ''
endfunction

function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
      \ '00': 'set relativenumber | set number',
      \ '01': 'set norelativenumber | set number',
      \ '10': 'set norelativenumber | set nonumber',
      \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    set number!<CR>
  endif
endfunction

" command line mode
" adds/remove lines above/below (if empty) from normal mode
"nmap <silent><C-j> o<Esc>
"nmap <silent><C-k> O<Esc>
"nmap <silent><A-j> :set paste<Return>m`o<Esc>``:set nopaste<CR>
"nmap <silent><A-k> :set paste<Return>m`O<Esc>``:set nopaste<CR>
imap <silent><C-l> <right>
" nnoremap <CR>:noh<CR><CR>
" shift+tab to jump outside enclosing chars
imap <silent><S-Tab> <C-o>A
" cmap <C-p> <Up>
" cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

" V I S U A L  M O D E
xnoremap <C-h> <C-w>h
xnoremap <C-j> <C-w>j
xnoremap <C-k> <C-w>k
xnoremap <C-l> <C-w>l

""move lines
xnoremap K :move '<-2<CR>gv=gv
xnoremap J :move '>+1<CR>gv=gv

" make
nnoremap <leader>m :w<CR> :silent make\|redraw!\|cc<CR>
:command! Makenode :set makeprg=tmux\ send-key\ -t\ 1\ node\\\ %\ Enter
:command! Makejasmine :set makeprg=tmux\ send-key\ -t\ 1\ npm\\\ test\ Enter

" langclients
function! mappings#langserver()
  if &runtimepath =~ 'coc.nvim'
    source ~/dotfiles/vim/mappings-coc.vim
  elseif &runtimepath =~ 'ale'
    nnoremap <silent> K :ALEHover <CR>
    nnoremap <silent> gd :ALEGoToDefinitionInSplit <CR>
    nnoremap <silent> <leader>r :ALERename <CR>
    nnoremap <silent> <leader>e :ALEDetail <CR>
    nnoremap <silent> <leader>p :ALEFix <CR>
  endif
endfunction

autocmd BufNewFile,BufRead * :call mappings#langserver()

