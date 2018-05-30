" Theme
set background=dark

if (has('termguicolors'))
 set termguicolors
endif

syntax enable
syntax on

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

try
  colorscheme OceanicNext
catch /^Vim\%((\a\+)\)\=:E185/
  " deal with it
endtry

let g:airline_theme='oceanicnext'

hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

if has('gui_running') || has('nvim')
  hi Normal guifg=#c0c5ce guibg=#1b2b34
else
  " Set the terminal default background and foreground colors, thereby
  " improving performance by not needing to set these colors on empty cells.
  hi Normal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  let &t_ti = &t_ti . "\033]10;#c0c5ce\007\033]11;#1b2b34\007"
  let &t_te = &t_te . "\033]110\007\033]111\007"
endif
