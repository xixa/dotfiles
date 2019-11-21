"Be a little more like Emacs when on insert mode, will you?
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill_line()<CR>

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

"make
nnoremap <leader>m :w<CR> :silent make\|redraw!\|cc<CR>
:command! Makenode :set makeprg=tmux\ send-key\ -t\ 1\ node\\\ %\ Enter
:command! Makejasmine :set makeprg=tmux\ send-key\ -t\ 1\ npm\\\ test\ Enter
