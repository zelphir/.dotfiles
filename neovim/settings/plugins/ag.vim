" ---
" The Silver Searcher
" ---
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --hidden
endif

