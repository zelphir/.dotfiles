" ---
"  Neomake
" ---

let g:jsx_ext_required = 0
" let g:neomake_open_list=1
let g:neomake_list_height=5
let g:neomake_verbose=0

" function! NeomakeESlintChecker()
"   let l:npm_bin = ''
"   let l:eslint = 'eslint'

"   if executable('npm')
"     let l:npm_bin = split(system('npm bin'), '\n')[0]
"   endif

"   if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
"     let l:eslint = l:npm_bin . '/eslint'
"   endif

"   let b:neomake_javascript_eslint_exe = l:eslint
" endfunction

function! HasConfig(file, dir)
  return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

" load local eslint in the project root
" modified from https://github.com/mtscout6/syntastic-local-eslint.vim
" let s:eslint_path = system('PATH=$(npm bin):$PATH & which eslint')
" let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_vim_enabled_makers = ['vint']
let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
autocmd BufNewFile,BufReadPre *.js let g:neomake_javascript_enabled_makers =
      \ HasConfig('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
      \ HasConfig('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
      \ HasConfig('.jscsrc', expand('<amatch>:h')) ? ['jscs'] :
      \     ['standard']

autocmd! BufWritePost,BufReadPost * Neomake
