" ---
" VimPlug
" ---
" Download and use vim-plug
"if empty(glob('$NVIM_HOME/autoload/plug.vim'))
"  silent !curl -fLo $NVIM_HOME/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall
"endif
"
"" Initialise vim-plug
"call plug#begin(expand('~/.local/share/nvim/plugged'))
"
"" Load plugin list for vim-plug to manage.
"execute 'source' Dot('plugins.vim')
"
"" Lock in the plugin list.
"call plug#end()
"
"autocmd VimEnter *
"  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \|   PlugInstall --sync | q
"  \| endif

" Load all plugin configuration files.
" for file in split(glob(Dot('modules/plugins/*.vim')), '\n')
"   exec 'source' file
" endfor
