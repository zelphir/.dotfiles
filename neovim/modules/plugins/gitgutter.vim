" ---
" GitGutter Symbols
" ---
let g:gitgutter_grep_command = 'ag --nocolor --nogroup --hidden'
let g:gitgutter_map_keys=0
let g:gitgutter_max_signs=9999
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '∓'
let g:gitgutter_sign_removed = '✖'
let g:gitgutter_sign_removed_first_line = '⇈'
let g:gitgutter_sign_modified_removed = '='

nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
nnoremap ,hs :GitGutterStageHunk<CR>
nnoremap ,hr :GitGutterRevertHunk<CR>
