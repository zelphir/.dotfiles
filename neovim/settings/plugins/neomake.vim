" ---
"  Neomake
" ---

let g:jsx_ext_required = 0
let g:neomake_open_list=1
let g:neomake_list_height=5
let g:neomake_verbose=0

let g:neomake_warning_sign = {
      \ 'text': '❯',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': '❯',
      \ 'texthl': 'ErrorMsg',
      \ }

function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

let g:neomake_vim_enabled_makers = ['vint']

au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')

autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
      \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
      \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
      \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
      \     ['standard']

autocmd! BufWritePost,BufReadPost * Neomake
