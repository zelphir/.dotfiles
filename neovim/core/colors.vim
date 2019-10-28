" From oceanic-next/colors/OceanicNext.vim
let g:base00            = '#1b2b34'
let g:base01            = '#343d46'
let g:base02            = '#4f5b66'
let g:base03            = '#65737e'
let g:base04            = '#a7adba'
let g:base05            = '#c0c5ce'
let g:base06            = '#cdd3de'
let g:base07            = '#d8dee9'
let g:base08            = '#ec5f67'
let g:base09            = '#f99157'
let g:base0A            = '#fac863'
let g:base0B            = '#99c794'
let g:base0C            = '#62b3b2'
let g:base0D            = '#6699cc'
let g:base0E            = '#c594c5'
let g:base0F            = '#ab7967'
let g:base10            = '#ffffff'
" Custom colors
let g:base00d           = '#18252c' " darker bg

"coc settings
" ---------------------------------------------------------
" if dein#tap('coc.nvim')
"   exe 'hi CocFloating guibg='.g:base00d
"   exe 'hi CocCodeLens guifg='.g:base02 .' gui=italic'
" endif
"
" if dein#tap('fzf.vim')
"   exe 'hi FzfFloating guibg='.g:base00d
" endif

" Set transparent bg
" hi Normal guibg=NONE guifg=NONE
" hi EndOfBuffer guibg=NONE

" Show the syntax group (for debugging themes)
nnoremap <leader>sg :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Background colors for active vs inactive windows
hi ActiveWindow guibg=#17252c
hi InactiveWindow guibg=#0D1B22

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd BufEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

" Underline error text
fun! s:matchUnderlineToColorscheme()
  let l:errormsg_color = synIDattr(synIDtrans(hlID("ErrorMsg")), "fg#")
  hi clear CocUnderline
  exec 'hi CocUnderline guifg=red gui=undercurl guisp=' . l:errormsg_color
endfun
augroup coc_custom
  au!
  autocmd ColorScheme * call s:matchUnderlineToColorscheme()
augroup end

func! HighlightTrailingSpace()
  highlight TrailingSpace ctermbg=red ctermfg=white guibg=#592929
  match TrailingSpace /\s\+\n/
endfu
command! TrailingSpaceHighlight call HighlightTrailingSpace()
command! TrailingSpaceDeleteAll :%s/\s\+\n/\r/gc

func! HighlightOverlength()
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endfu

" Change Cursor Style Dependent On Mode: https://github.com/mhinz/vim-galore#change-cursor-style-dependent-on-mode {{{
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
