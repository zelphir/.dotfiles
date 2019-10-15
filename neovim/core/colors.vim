" From oceanic-next/colors/OceanicNext.vim
let s:base00 = '#1b2b34'
let s:base01 = '#343d46'
let s:base02 = '#4f5b66'
let s:base03 = '#65737e'
let s:base04 = '#a7adba'
let s:base05 = '#c0c5ce'
let s:base06 = '#cdd3de'
let s:base07 = '#d8dee9'
let s:base08 = '#ec5f67'
let s:base09 = '#f99157'
let s:base0A = '#fac863'
let s:base0B = '#99c794'
let s:base0C = '#62b3b2'
let s:base0D = '#6699cc'
let s:base0E = '#c594c5'
let s:base0F = '#ab7967'
let s:base10 = '#ffffff'

" Custom colors
let s:base00d = '#18252c' " darker bg

"coc settings
" ---------------------------------------------------------
if dein#tap('coc.nvim')
  exe 'hi CocFloating guibg='.s:base00d
  exe 'hi CocCodeLens guifg='.s:base02 .' gui=italic'
endif

" Set transparent bg
hi Normal guibg=NONE guifg=NONE
hi EndOfBuffer guibg=NONE


" Show the syntax group (for debugging themes)
nnoremap <leader>sg :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
