"TODO
"- fix line breaking for one line functions
"

"fold styling
highlight Folded guibg=NONE guifg=grey

function! DocstringFold()
    let first_line = getline(v:foldstart)
    let second_line = getline(v:foldstart + 1)

    "if is docstring
    if match(first_line, '^\s*@doc """') > -1
      let doc_txt = substitute(second_line, '^\s*', '', 'g')
    "if is test
    elseif match(first_line, '^\s*test\|@.* ') > -1
      let doc_txt = substitute(first_line, 'do', '', 'g')
    "if is function
    elseif match(first_line, '^\s*def[ |p ]') > -1
      let function_def = substitute(first_line, '^\s*\|).*\| do', '', 'g')
      "checks arity
      if match(function_def, '(') > - 1
        let arity = len(split(function_def, ',', 1))
      else
        let arity = 0
      endif
      let doc_txt = substitute(function_def, 'defp \|def \|(.*', '', 'g') . '/' . arity
    endif

    let indent_len = indent(v:foldstart)
    let folded_lines = v:foldend-v:foldstart
    let indent = repeat(' ', indent_len)
    " let prefix = '≡ '
    let prefix = '+ '
    let end_filler = ' ('. folded_lines . ')  '
    let offset = 4
    let max_len = winwidth(0) - (indent_len + len(prefix) + len(end_filler) + offset)
    let text =  doc_txt[:max_len]
    let filler = repeat(' ', winwidth(0) - indent_len - len(prefix) - len(end_filler) - len(text) - offset + 1)
    return indent . prefix . text . filler . end_filler
endfunction
set foldtext=DocstringFold()

" elixir
function! ElixirDocsFold()
  let line = getline(v:lnum)
  if match(line, '^\s*def[ |p ].*do:') > -1
    return ">1"
  elseif match(line, '^\s*test\|@.* """\|def[ |p ]') > -1
    return ">1"
  elseif match(line, '^\s*"""\|end$') > -1
    return "<1"
  else
    return "="
  endif
endfunction

autocmd FileType elixir setlocal foldmethod=expr foldexpr=ElixirDocsFold()
