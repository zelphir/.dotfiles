" Disable AutoSave on multiple cursors

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':AutoSaveToggle')==2
    exe 'AutoSaveToggle'
  endif
endfunction
