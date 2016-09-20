scriptencoding utf-8

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return $NEOVIM . a:path
endfunction

" --------------------------------
" Setting leader {{{
" --------------------------------
let g:mapleader="\<Space>"
"}}}

" Load all configuration modules.
for file in split(glob(Dot('modules/*.vim')), '\n')
  execute 'source' file
endfor
