set nohlsearch                                          " Don't highlight matches
set incsearch                                           " incremental searching
set ignorecase                                          " searches are case insensitive...
set smartcase                                           " ... unless they contain at least one capital letter

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
