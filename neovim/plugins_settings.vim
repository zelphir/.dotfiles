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
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline_powerline_fonts                   = 1

" Vim Lion
let b:lion_squeeze_spaces = 1

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Deoplete.
set completeopt=longest,menuone,preview
let g:deoplete#enable_at_startup         = 1
let g:deoplete#omni#functions            = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources                   = {}
let g:deoplete#sources['javascript']     = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:SuperTabClosePreviewOnPopupClose   = 1

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
" let g:vim_jsx_pretty_colorful_config  = 1
