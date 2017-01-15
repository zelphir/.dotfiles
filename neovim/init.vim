scriptencoding utf-8

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return "$HOME/.config/nvim/" . a:path
endfunction

" Init plugins
execute 'source' Dot('plugins/init.vim')

" Load all configuration modules.
for file in split(glob(Dot('settings/*.vim')), '\n')
  execute 'source' file
endfor
