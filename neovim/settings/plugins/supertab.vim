set completeopt-=preview

let g:SuperTabLongestEnhanced          = 1
let g:SuperTabLongestHighlight         = 0
" let g:SuperTabClosePreviewOnPopupClose = 1

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
