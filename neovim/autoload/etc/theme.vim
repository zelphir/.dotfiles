function! etc#theme#init() abort
  try
    colorscheme OceanicNext
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
  endtry
endfunction
