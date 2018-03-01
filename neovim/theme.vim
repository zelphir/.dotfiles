" Theme
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1

try
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

let g:airline_theme='gruvbox'
