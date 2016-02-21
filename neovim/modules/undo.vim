set history=1000

" Undo, swap, and backup files
if has('persistent_undo')
  set undofile
  set undolevels=1000         " Maximum number of changes that can be undone
  set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set undodir=~/.cache/nvim/tmp/undo/
set backup
set backupdir=~/.cache/nvim/tmp/
set noswapfile
set writebackup

set autoread                  " Just load a changed file
