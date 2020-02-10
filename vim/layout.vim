" " status line
" set title
" set ruler                                         " display info on the right bottom
" set showmode
" set laststatus=2                                  " shows status bar (
"                                                   " 0=never, 1=if 2+ windows, 2=always)
" set statusline=%f                                 " file name
" " set statusline+=,\ %{strlen(&fenc)?&fenc:'none'}  " file encoding
" "set statusline+=[%{&ff}]                          " file format
" set statusline+=\ %y                              " filetype
" set statusline+=,\ %h                               " help file flag
set statusline+=\ %m                                " modified flag
" set statusline+=,\ %r                                " read only flag
set statusline+=\ %=                              " align left
set statusline+=行%l/%L"[%p%%]                    " line X of Y [percent of file]
set statusline+=\ \ 列%c                          " current column
set statusline+=\ \ ◼\ %n\                        " Buffer number
" set statusline+=\ [%b][0x%B]\                    " ASCII and byte code under cursor
set cmdheight=1                                   " cmd line bit size


" MODES
" defines visuals for normal and insert modes
autocmd InsertEnter * call MyInsertMode()
autocmd InsertLeave * call MyNormalMode()

function! MyNormalMode()
  set cursorcolumn
  set nocursorline
  hi statusline ctermfg=7 guifg=#c0c0c0 ctermbg=0
endfunction

function! MyInsertMode()
  set cursorline
  set nocursorcolumn
  hi statusline ctermfg=197 guifg=#ff005f ctermbg=0
endfunction

" if has('linebreak')
"   let &showbreak='↳  '
" endif

execute 'highlight link EndOfBuffer ColorColumn'
