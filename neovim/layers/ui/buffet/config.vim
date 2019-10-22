function! g:BuffetSetCustomColors()
  exe 'hi! BuffetTab guibg='.g:base00.' guifg='.g:base04
  exe 'hi! BuffetBuffer guibg='.g:base01.' guifg='.g:base03
  exe 'hi! BuffetModBuffer guibg='.g:base01.' guifg='.g:base0A
  exe 'hi! BuffetCurrentBuffer guibg='.g:base0C.' guifg='.g:base00d
  exe 'hi! BuffetModCurrentBuffer guibg='.g:base0A.' guifg='.g:base00
  exe 'hi! BuffetActiveBuffer guibg='.g:base00.' guifg='.g:base0C
  exe 'hi! BuffetTrunc guibg='.g:base00d.' guifg='.g:base07
endfunction

let g:buffet_separator        = ""
let g:buffet_noseparator      = ""
let g:buffet_tab_icon         = "﬘"
let g:buffet_use_devicons     = 1
let g:buffet_left_trunc_icon  = ""
let g:buffet_right_trunc_icon = ""
let g:buffet_modified_icon    = " "

" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bw!<CR>
