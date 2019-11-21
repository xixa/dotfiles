" status line
set title
set ruler                                         " display info on the right bottom
set showmode
set laststatus=2                                  " shows status bar (
                                                  " 0=never, 1=if 2+ windows, 2=always)
set statusline=%f                                 " file name
"set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
"set statusline+=%{&ff}]                          " file format
"set statusline+=%y                               " filetype
"set statusline+=%h                               " help file flag
set statusline+=%m                                " modified flag
"set statusline+=%r                               " read only flag
set statusline+=\ %=                             " align left
set statusline+=行%l/%L"[%p%%]                    " line X of Y [percent of file]
set statusline+=\ \ 列%c                          " current column
set statusline+=\ \ ◼\ %n\                        " Buffer number
"set statusline+=\ [%b][0x%B]\                    " ASCII and byte code under cursor

