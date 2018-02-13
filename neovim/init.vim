" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '$HOME/.config/nvim/' . a:path
endfunction

execute 'source' Dot('settings.vim')
execute 'source' Dot('maps.vim')

" Vim-plug plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup vimrc
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')
execute 'source' Dot('plugins.vim')
call plug#end()

execute 'source' Dot('plugins_settings.vim')
execute 'source' Dot('theme.vim')

if filereadable(glob(Dot('local.vim')))
  execute 'source' Dot('local.vim')
endif
