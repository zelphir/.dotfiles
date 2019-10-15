" let g:dein#auto_recache = 1
let g:dein#install_max_processes = 16

function! etc#dein#init() abort
  let s:dein_dir = expand(g:etc#cache_path . '/dein')
  let s:dein_toml = $NVIM_HOME . '/core/dein.toml'
  let s:dein_lazy_toml = $NVIM_HOME . '/core/deinlazy.toml'

  " Clone Dein if not exists.
  if !isdirectory(s:dein_dir)
    execute 'silent !git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif

  " Prepend Dein to runtime path.
  execute 'set runtimepath^=' . expand(s:dein_dir)

  " Plugins managed with Dein
  if dein#load_state(expand(s:dein_dir)) ", [$MYVIMRC, s:dein_toml, s:dein_lazy_toml])

    " Plugin system initialization
    call dein#begin(expand(s:dein_dir))

    " Let Dein manage Dein.
    call dein#add(expand(s:dein_dir))

    " call dein#add('ryanoasis/vim-devicons', {'lazy': 0})
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
    call dein#end()
    call dein#save_state()
  endif

  " Install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

  filetype plugin indent on

  " Trigger source events, only when vim is starting
  if has('vim_starting')
    syntax enable
  else
    call dein#call_hook('source')
    call dein#call_hook('post_source')
  endif
endfunction
