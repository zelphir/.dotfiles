scriptencoding 'utf-8'

" Indent guides
let g:indentLine_char                = '│'
let g:indentLine_color_gui           = '#2A3A43'
let g:indentLine_color_term          = 155

" Fzf
let g:fzf_files_options =
  \ '--preview "coderay {} ; or cat {} 2> /dev/null | head -'.&lines.'"'

augroup vimrc
  autocmd VimEnter * command! -bang Colors
    \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
augroup END

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled     = 1
let g:airline_powerline_fonts            = 1

" Vim Lion
let b:lion_squeeze_spaces = 1

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" TernJS
let g:tern_request_timeout       = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#command               = ['tern']
let g:tern#arguments             = ['--persistent']

" MatchTagAlways
let g:mta_filetypes = {
  \ 'html'           : 1,
  \ 'xml'            : 1,
  \ 'javascript'     : 1,
  \ 'javascript.jsx' : 1,
  \}

" Startify
let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 0
let g:startify_files_number           = 6
let g:startify_relative_path          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_bookmarks              = [{ 'd': '~/.dotfiles' }]
let g:startify_list_order             = [
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ['   LRU:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

" Gutentags
let g:gutentags_ctags_executable_javascript = 'jsctags'
let g:gutentags_ctags_exclude               = [ 'node_modules', '.git' ]
let g:gutentags_define_advanced_commands    = 1

" Neosnippets
let g:neosnippet#enable_completed_snippet      = 1
let g:neosnippet#disable_runtime_snippets      = {'_': 1}
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory            = '~/.config/nvim/snippets'

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.js'

" Polyglot
let g:polyglot_disabled = ['javascript', 'javascript.jsx']

" ALE
let g:ale_linters                        = {'javascript': ['eslint']}
let g:ale_fixer                          = {'javascript': ['prettier']}
let g:ale_sign_error                     = ''
let g:ale_sign_warning                   = ''
let g:ale_javascript_standard_use_global = 1
let g:ale_javascript_standard_options    = '--parser babel-eslint'

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" MultipleCursors
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            ='<C-d>'
let g:multi_cursor_prev_key            ='<C-p>'
let g:multi_cursor_skip_key            ='<C-x>'
let g:multi_cursor_quit_key            ='<Esc>'
