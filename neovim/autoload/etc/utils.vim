function! etc#utils#error(msg) abort
  for l:mes in etc#utils#str2list(a:msg)
    echohl WarningMsg | echomsg '[vim-etc] ' . l:mes | echohl None
  endfor
endfunction

function! etc#utils#str2list(expr) abort
  " Convert string to list
  return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction

function! etc#utils#ensure_directory(paths) abort
  for l:path in etc#utils#str2list(a:paths)
    if ! isdirectory(l:path)
      call mkdir(l:path, 'p')
    endif
  endfor
endfunction

function! etc#utils#source_file(path, ...) abort
  " Source user configuration files with set/global sensitivity
  let use_global = get(a:000, 0, ! has('vim_starting'))
  let abspath = resolve(g:etc#vim_path . '/' . a:path)
  if ! use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  let tempfile = tempname()
  let content = map(readfile(abspath),
        \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
  try
    call writefile(content, tempfile)
    execute printf('source %s', fnameescape(tempfile))
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction
