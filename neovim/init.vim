" Wraps paths to make them relative to this directory.
function! Dot(path)
  return "$HOME/.config/nvim/" . a:path
endfunction

execute 'source' Dot('settings.vim')
execute 'source' Dot('maps.vim')

" Vim-plug plugins
call plug#begin('~/.local/share/nvim/plugged')
execute 'source' Dot('plugins.vim')
call plug#end()

execute 'source' Dot('plugins_settings.vim')
execute 'source' Dot('theme.vim')
