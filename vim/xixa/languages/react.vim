function! xixa#languages#react#this() abort
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

  if &runtimepath =~ "vvim-styled-jsx"
    let g:context#commentstring#table['typescript.jsx'] = {
          \ 'jsComment': '// %s',
          \ 'jsImport': '// %s',
          \ 'jsxStatment': '// %s',
          \ 'jsxRegion': '{/*%s*/}'
          \ }
  endif

  " if &runtimepath =~ "vim-jsx-typescript"
    " dark red
    hi tsxTagName guifg=#E06C75

    " orange
    hi tsxCloseString guifg=#F99575
    hi tsxCloseTag guifg=#F99575
    hi tsxCloseTagName guifg=#F99575
    hi tsxAttributeBraces guifg=#F99575
    hi tsxEqual guifg=#F99575

    " yellow
    hi tsxAttrib guifg=#F8BD7F cterm=italic

    " light-grey
    hi tsxTypeBraces guifg=#999999

    " dark-greyjj
    hi tsxTypes guifg=#666666
    hi ReactState guifg=#C176A7
    hi ReactProps guifg=#D19A66
    hi ApolloGraphQL guifg=#CB886B
    hi Events ctermfg=204 guifg=#56B6C2
    hi ReduxKeywords ctermfg=204 guifg=#C678DD
    hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
    hi WebBrowser ctermfg=204 guifg=#56B6C2
    hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
  " endif
endfunction

" autocmd BufEnter * :call xixa#languages#react#this()
