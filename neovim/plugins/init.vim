" ---
" VimPlug
" ---

if empty(glob('$NVIM_HOME/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $NVIM_HOME/init.vim
endif

call plug#begin('~/.local/share/nvim/plugged')
execute 'source' Dot('plugins/list.vim')
call plug#end()
