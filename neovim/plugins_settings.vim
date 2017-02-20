scriptencoding 'utf-8'

" Polyglot
let g:polyglot_disabled = ['javascript']

" Indent guides
let g:indentLine_char                = '│'
let g:indentLine_color_gui           = '#2A3A43'
let g:indentLine_color_term          = 155
" let g:indentLine_leadingSpaceChar    = '∙'
" let g:indentLine_leadingSpaceEnabled = 1

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
let g:airline#extensions#neomake#enable         = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline_powerline_fonts                   = 1

" Vim Lion
let b:lion_squeeze_spaces = 1

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Deoplete.
set completeopt=longest,menuone,preview
set completeopt-=preview
let g:deoplete#enable_at_startup         = 1
let g:deoplete#omni#functions            = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources                   = {}
let g:deoplete#sources['javascript']     = [
  \ 'buffer',
  \ 'file',
  \ 'ultisnips',
  \ 'neosnippet',
  \ 'ternjs'
  \ ]

" TernJS
let g:tern_request_timeout               = 1
let g:tern_show_signature_in_pum         = '0'
let g:tern#command                       = ['tern']
let g:tern#arguments                     = ['--persistent']

" Neomake
function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

let g:neomake_javascript_standard_maker = {'args': ['--parser', 'babel-eslint']}

augroup vimrc
  au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
  autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
    \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
    \ ['standard']
augroup END

" JS/JSX
autocmd BufNewFile,BufRead *.js  set filetype=javascript
" let g:vim_jsx_pretty_colorful_config  = 1
" let g:jsx_ext_required = 0

" Snippets
augroup vimrc
  autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
augroup END
" let g:UltiSnipsExpandTrigger="<C-j>"

" MatchTagAlways
let g:mta_filetypes = {
  \ 'html'       : 1,
  \ 'xml'        : 1,
  \ 'javascript' : 1,
  \}

" Startify
let g:startify_change_to_vcs_root     = 1
let g:startify_enable_special         = 0
let g:startify_files_number           = 6
let g:startify_relative_path          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
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
let g:startify_bookmarks              = [
  \ { 'd': '~/.dotfiles' },
  \ ]

" Gutentags
let g:gutentags_ctags_executable_javascript = 'jsctags'
let g:gutentags_ctags_exclude                     = [ 'node_modules', '.git' ]
let g:gutentags_define_advanced_commands    = 1
