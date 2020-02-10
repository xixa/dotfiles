function! layout-lisp#plugins()
  if &runtimepath =~ "autopairs"
    au FileType clojure let b:autopairs_loaded=1
  endif
endfunction

autocmd! FileType *.clj :call layout-lisp#plugins()

