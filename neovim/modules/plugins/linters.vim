" ---
"  Syntastic/Neomake
" ---
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:jsx_ext_required = 0

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'eslint_d'

function! HasConfig(file, dir)
    return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js  let g:neomake_javascript_enabled_makers =
    \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
    \     ['happiness']

autocmd! BufWritePost * Neomake
let g:neomake_open_list=1
let g:neomake_list_height=5

noremap - :Autoformat<CR>
