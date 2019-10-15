function! g:BuffetSetCustomColors()
  hi! BuffetTab guibg=#434C5E guifg=#D8DEE9
  hi! BuffetBuffer guibg=#4C566A guifg=#2E3440
  hi! BuffetModBuffer guibg=#4C566A guifg==#D8DEE9
  hi! BuffetCurrentBuffer guibg=#81A1C1 guifg=#2E3440
  hi! BuffetModCurrentBuffer guibg=#D08770 guifg=#D8DEE9
  hi! BuffetActiveBuffer guibg=#434C5E guifg=#2E3440
  hi! BuffetTrunc guibg=#3B4252 guifg=#D8DEE9
endfunction

let g:buffet_tab_icon = "﬘"
let g:buffet_use_devicons = 1
let g:buffet_left_trunc_icon = ""
let g:buffet_right_trunc_icon = ""
let g:buffet_modified_icon = " "

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" noremap <C-p> :bp<CR>
" noremap <C-n> :bn<CR>
" noremap <C-x> :bd<CR>
" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bw!<CR>
" noremap <C-t> :tabnew split<CR>
