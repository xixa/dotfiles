" TODO:
"   - fix break line icon to work with popup (e.g. coc)

" EDITOR
set cursorcolumn                                  " highlights cursor column
set number                                        " show current line number
set relativenumber                                " show line numbers relative to position
set title
set ruler                                           " display info on the right bottom
set showmode
" if has('linebreak')                               " shows icon for line break
"   let &showbreak='↳  '
" endif

" STATUS BAR
" set laststatus=2                                  " shows status bar (0=never, 1=if 2+ windows, 2=always)
set statusline=%f                                   " file name
" set statusline+=,\ %{strlen(&fenc)?&fenc:'none'}  " file encoding
" set statusline+=[%{&ff}]                          " file format
set statusline+=\ %y                                " filetype
" set statusline+=,\ %h                             " help file flag
set statusline+=\ %m                                " modified flag
" set statusline+=,\ %r                             " read only flag
set statusline+=\ %=                                " align left
set statusline+=行%l/%L"[%p%%]                      " line X of Y [percent of file]
set statusline+=\ \ 列%c                            " current column
set statusline+=\ \ ◼\ %n\                          " Buffer number
" set statusline+=\ [%b][0x%B]\                     " ASCII and byte code under cursor

" COMMAND LINE
set cmdheight=1                                     " cmd line bit size

" NORMAL/INSERT MODES
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

" ACTIVE/INACTIVE BUFFERS
" hi ActiveWindow guibg=#17252c
" hi InactiveWindow guibg=#0D1B22
" hi InactiveWindow guibg=#ffffff
" hi PreviewWindow guibg=#000000

augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" change highlight group of active/inactive windows
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:PreviewWindow
  else
    setlocal winhighlight=Normal:WarningMsg,NormalNC:InactiveWindow
    setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  endif
endfunction

execute 'highlight link EndOfBuffer ColorColumn'

" augroup CursorLineOnlyInActiveWindow
"     autocmd!
"       autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"         autocmd WinLeave * setlocal nocursorline
"       augroup END

" highlight TermCursor ctermfg=red guifg=red        " colors terminal cursor

