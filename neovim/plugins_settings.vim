" Indent guides
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar    = '.'
let g:indentLine_char = '¦'
let g:indentLine_color_term          = 155
let g:indentLine_color_gui           = '#504945'

" Fzf
let g:fzf_files_options =
  \ '--preview "coderay {} ; or cat {} 2 > /dev/null | head -'.&lines.'"'

" :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
" :Ag! - Start fzf in fullscreen and display the preview window above
autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
