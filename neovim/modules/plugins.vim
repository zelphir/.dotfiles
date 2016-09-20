" ---
" VimPlug
" ---
" Download and use vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/plug/vim-plug/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.config/nvim/autoload && cd ~/.config/nvim/autoload && ln -s ../plug/vim-plug/plug.vim .
  autocmd VimEnter * PlugInstall
endif


" Initialise vim-plug
call plug#begin($NEOVIM . '/plugged')

" Load plugin list for vim-plug to manage.
execute 'source' Dot('plugins.vim')

" Lock in the plugin list.
call plug#end()

" Load all plugin configuration files.
for file in split(glob(Dot('modules/plugins/*.vim')), '\n')
  exec 'source' file
endfor
