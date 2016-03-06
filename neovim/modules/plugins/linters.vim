" ---
"  Neomake
" ---

let g:jsx_ext_required = 0
" let g:neomake_open_list=1
let g:neomake_list_height=5
let g:neomake_verbose=0

function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
      \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint_d'] :
      \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
      \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
      \     ['standard']

autocmd BufNewFile,BufReadPre *.js let g:neomake_jsx_enabled_makers =
      \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint_d'] :
      \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
      \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
      \     ['standard']

let g:neomake_vim_enabled_makers = ['vint']
autocmd! BufWritePost * Neomake

noremap - :Autoformat<CR>
