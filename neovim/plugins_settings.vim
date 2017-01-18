" Indent guides
let g:indentLine_char                = '│'
let g:indentLine_color_gui           = '#2A3A43'
let g:indentLine_color_term          = 155
let g:indentLine_leadingSpaceChar    = '∙'
let g:indentLine_leadingSpaceEnabled = 1

" Fzf
let g:fzf_files_options =
      \ '--preview "coderay {} ; or cat {} 2> /dev/null | head -'.&lines.'"'
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
let g:tern#command                       = ["tern"]
let g:tern#arguments                     = ["--persistent"]

" Neomake
function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
  \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
  \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
  \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
  \ ['standard']

" JS/JSX
autocmd BufNewFile,BufRead *.js  set filetype=javascript
let g:vim_jsx_pretty_colorful_config  = 1

" Snippets
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
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

let g:startify_list_order = [
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ['   LRU:'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ]

let g:startify_bookmarks = [
  \ { 'd': '~/.dotfiles' },
  \ ]

" Netrw
com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

fun! Lexplore(dir, right)
  if exists("t:netrw_lexbufnr")
  " close down netrw explorer window
  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
  if lexwinnr != -1
    let curwin = winnr()
    exe lexwinnr."wincmd w"
    close
    exe curwin."wincmd w"
  endif
  unlet t:netrw_lexbufnr

  else
    " open netrw explorer window in the dir of current file
    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
    exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun

let g:netrw_list_hide     = '.*\.swp$,.DS_Store'
let g:netrw_localrmdir    = 'rm -r'
let g:netrw_winsize       = -28       " absolute width of netrw window
let g:netrw_banner        = 0         " do not display info on the top of window
let g:netrw_liststyle     = 3         " tree-view
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
let g:netrw_browse_split  = 4         " use the previous window to open file
