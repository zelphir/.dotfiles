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

" TernJS
" let g:tern_request_timeout       = 1
" let g:tern_show_signature_in_pum = '0'
" let g:tern#command               = ['tern']
" let g:tern#arguments             = ['--persistent']

" MatchTagAlways
let g:mta_filetypes = {
  \ 'html'           : 1,
  \ 'xml'            : 1,
  \ 'javascript'     : 1,
  \ 'javascript.jsx' : 1,
  \ 'vue'            : 1,
  \}

" Startify
" let g:startify_change_to_vcs_root     = 1
" let g:startify_enable_special         = 0
" let g:startify_files_number           = 6
" let g:startify_relative_path          = 1
" let g:startify_session_autoload       = 1
" let g:startify_session_persistence    = 1
" let g:startify_session_delete_buffers = 1
" let g:startify_bookmarks              = [{ 'd': '~/.dotfiles' }]
" let g:startify_list_order             = [
"   \ ['   LRU within this dir:'],
"   \ 'dir',
"   \ ['   Sessions:'],
"   \ 'sessions',
"   \ ['   Bookmarks:'],
"   \ 'bookmarks',
"   \ ]

" " Gutentags
" let g:gutentags_ctags_exclude            = [
"   \ 'node_modules',
"   \ '.git',
"   \ '*.min.js',
"   \ '*.min.css',
"   \ 'build',
"   \ 'dist',
"   \ 'vendor'
"   \ ]
" let g:gutentags_define_advanced_commands = 1

" Snippets
" let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'mysnippets']

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.vue,*.js'

" Polyglot
let g:polyglot_disabled = ['typescript.jsx', 'typescript', 'javascript', 'javascript.jsx', 'vue']

" ALE
" let g:ale_linters                              = {}
" let g:ale_linters['javascript']                = ['eslint']
" let g:ale_linters['javascript.jsx']            = ['eslint']
" let g:ale_linters['graphql']                   = ['gqlint']
" let g:ale_linters['json']                      = ['prettier']
" let g:ale_linters['css']                       = ['stylelint']
" let g:ale_linters['scss']                      = ['stylelint']
" let g:ale_fixers                               = {}
" let g:ale_fixers['javascript']                 = ['prettier']
" let g:ale_fixers['javascript.jsx']             = ['prettier']
" let g:ale_fixers['graphql']                    = ['prettier']
" let g:ale_fixers['json']                       = ['prettier']
" let g:ale_fixers['css']                        = ['prettier']
" let g:ale_fixers['scss']                       = ['prettier']
" let g:ale_linters = {'javascript': ['eslint', 'flow']}
" let g:ale_sign_error                           = ''
" let g:ale_sign_warning                         = ''
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_lint_on_enter                        = 0

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
"   autocmd FileType html,css,javascript,javascript.jsx EmmetInstall
" augroup END

" Jsx
" let g:vim_jsx_pretty_colorful_config = 1

" NCM2
" augroup vimrc
"   autocmd BufEnter * call ncm2#enable_for_buffer()
" augroup END
" let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsExpandTrigger            = '<c-j>'

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

" Signify
" let g:signify_realtime = 1
" let g:signify_line_highlight = 1

" ImportCost
" augroup import_cost_auto_run
"   autocmd!
"   autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
"   autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
"   autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
" augroup END
