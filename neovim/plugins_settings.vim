" Indent guides
let g:indentLine_char                = '¦'
let g:indentLine_color_gui           = '#504945'
let g:indentLine_color_term          = 155
let g:indentLine_leadingSpaceChar    = '.'
let g:indentLine_leadingSpaceEnabled = 1

" Fzf
let g:fzf_files_options =
  \ '--preview "coderay {} 2> /dev/null | head -'.&lines.'"'
autocmd VimEnter * command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Airline
let g:airline#extensions#neomake#enable         = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline_powerline_fonts                   = 1

" Vim Lion
let b:lion_squeeze_spaces = 1
