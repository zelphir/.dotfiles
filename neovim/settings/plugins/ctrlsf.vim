let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
let g:ctrlsf_winsize = '70%'
" let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0

nnoremap <leader>f :CtrlSF<Space>
nnoremap <leader>F :CtrlSFToggle<CR>

let g:ctrlsf_mapping = {
      \ "next"    : "n",
      \ "prev"    : "N",
      \ "quit"    : "q",
      \ "openb"   : "",
      \ "split"   : "s",
      \ "tab"     : "",
      \ "tabb"    : "",
      \ "popen"   : "",
      \ "pquit"   : "",
      \ "loclist" : "",
      \ }

nnoremap <silent> ,g :call utils#searchCurrentWordWithAg()<CR>
