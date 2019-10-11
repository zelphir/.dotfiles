function! etc#theme#init() abort
  let g:nord_cursor_line_number_background = 1
  let g:nord_bold_vertical_split_line = 1
  let g:nord_uniform_diff_background = 1
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1

  try
    colorscheme nord
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
  endtry

  " Set transparent bg
  hi Normal guibg=NONE guifg=NONE
  hi EndOfBuffer guibg=NONE
endfunction
