" ---
"  Neomake
" ---

let g:jsx_ext_required = 0
" let g:neomake_open_list=1
let g:neomake_list_height=5
let g:neomake_verbose=0

function! NeomakeESlintChecker()
  let l:npm_bin = ''
  let l:eslint = 'eslint'

  if executable('npm')
    let l:npm_bin = split(system('npm bin'), '\n')[0]
  endif

  if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
    let l:eslint = l:npm_bin . '/eslint'
  endif

  let b:neomake_javascript_eslint_exe = l:eslint
endfunction

function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

let g:neomake_vim_enabled_makers = ['vint']

autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
      \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
      \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
      \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
      \     ['standard']

autocmd FileType javascript :call NeomakeESlintChecker()
autocmd! BufWritePost,BufReadPost * Neomake
