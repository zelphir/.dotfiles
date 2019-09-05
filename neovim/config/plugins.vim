scriptencoding 'utf-8'

" Indent guides
let g:indentLine_char       = '│'
let g:indentLine_color_gui  = '#2A3A43'
let g:indentLine_color_term = 155

" Fzf
let g:fzf_files_options =
  \ '--preview "coderay {} ; or cat {} 2> /dev/null | head -'.&lines.'"'

augroup vimrc
  autocmd VimEnter * command! -bang Colors
    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
augroup END

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" MatchTagAlways
let g:mta_filetypes = {
  \ 'html'           : 1,
  \ 'xml'            : 1,
  \ 'javascript'     : 1,
  \ 'javascript.jsx' : 1,
  \ 'vue'            : 1,
  \}

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.vue,*.js'

" NERDTree
let NERDTreeIgnore = ['^tags.lock$', '^.tern-port$']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1

augroup vimrc
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Emmet
" let g:user_emmet_install_global = 0
" let g:user_emmet_leader_key     = '<Tab>'
" let g:user_emmet_settings       = {
" \  'javascript.jsx' : {
" \    'extends': 'jsx',
" \    'default_attributes': {
" \      'label': [{'htmlFor': ''}],
" \      'class': {'className': ''},
" \    }
" \  },
" \}

" augroup vimrc
"   autocmd FileType
"   html,css,javascript,javascript.jsx,typescript.tsx EmmetInstall
" augroup END

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts            = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'C',
    \ 'i'  : 'I',
    \ 'ic' : 'I',
    \ 'ix' : 'I',
    \ 'n'  : 'N',
    \ 'ni' : 'N',
    \ 'no' : 'N',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ }

" ImportCost
" augroup import_cost_auto_run
"   autocmd!
"   autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
"   autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
"   autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
" augroup END
