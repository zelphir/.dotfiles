scriptencoding utf-8

if exists('g:mysl_loaded')
  finish
endif

let g:mysl_loaded = 1

function! s:ActiveStatusLine()
  let s:statusline=""

  " Utils statusline
  if mysl#IsUtils()
    let s:statusline.="%#FileName#"
    let s:statusline.="%{mysl#Filename()}"
    let s:statusline.="%{mysl#modifiedStatus(0)}"
    let s:statusline.="%="
    let s:statusline.="%#UtilsInfo#%{mysl#UtilsInfo()}"
    return s:statusline
  endif

  let s:statusline="%#VimMode#"
  let s:statusline.="\ "
  let s:statusline.="%{mysl#VimMode()}"
  let s:statusline.="\ "

  if mysl#ShowFilePath() && mysl#shouldShow()
    let s:statusline.="%#FilePath#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#FilePath()}"
    let s:statusline.="\ "
  endif

  if mysl#shouldShow()
    let s:statusline.="%#FileName#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#Filename()}"
    let s:statusline.="%{mysl#modifiedStatus(1)}"
  else
    let s:statusline.="%#FileName#"
    let s:statusline.="%{mysl#modifiedStatus(1)}"
  endif

  if !empty(get(g:,'coc_git_status', ''))
    let s:statusline.="%#GitBranch#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#GitBranch()}"
    let s:statusline.="\ "
    let s:statusline.="%#Reset#"
  endif

  if !empty(get(b:,'coc_git_status', '')) && mysl#shouldShow()
    let s:statusline.="%#DarkBgSep#"
    let s:statusline.="|"
    let s:statusline.="%#GitStatusAdded#"
    let s:statusline.="%{mysl#GitFileStatus('added')}"
    let s:statusline.="%#GitStatusRemoved#"
    let s:statusline.="%{mysl#GitFileStatus('removed')}"
    let s:statusline.="%#GitStatusModified#"
    let s:statusline.="%{mysl#GitFileStatus('modified')}"
    let s:statusline.="\ "
  endif

  if !empty(mysl#CocMsg('error'))|| !empty(mysl#CocMsg('warning'))
    if !empty(get(b:, 'coc_diagnostic_info', {}))
      let s:statusline.="%#DiagnosticSymbol#"
      let s:statusline.="\ "
      let s:statusline.=""
      let s:statusline.="\ "
    endif

    let s:statusline.="%#CocError#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#CocMsg('error')}"

    if !empty(mysl#CocMsg('error')) && !empty(mysl#CocMsg('warning'))
      let s:statusline.="\ "
    endif

    let s:statusline.="%#CocWarn#"
    let s:statusline.="%{mysl#CocMsg('warning')}"
    let s:statusline.="\ "
    let s:statusline.="%#Reset#"
  endif

  if mysl#shouldShow()
    let s:statusline.="%#CocInfo#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#CocInfo()}"
    let s:statusline.="\ "
  endif

  let s:statusline.="%="

  if mysl#shouldShow()
    let s:statusline.="%#Encoding#"
    let s:statusline.="\ "
    let s:statusline.="%{mysl#FileEncoding()}"
    let s:statusline.="\ "
    let s:statusline.="%#FileFormat#%{mysl#Fileformat()}"
  endif

  let s:statusline.="\ "
  let s:statusline.="%#LineInfo#%{mysl#LineInfo()}"
  let s:statusline.="\ "
  return s:statusline
endfunction

function! s:InactiveStatusLine()
  let s:statusline=""
  if mysl#IsUtils()
    let s:statusline.="%#Reset#"
  else
    let s:statusline.="%#DarkBgSep#"
  endif
  let s:statusline.="\ "
  let s:statusline.="%{mysl#Filename()}"
  let s:statusline.="%{mysl#modifiedStatus(0)}"
  if mysl#IsUtils()
    let s:statusline.="%#Reset#"
  else
    let s:statusline.="%#DarkBgSep#"
  endif
  let s:statusline.="%="

  if mysl#IsUtils()
    let s:statusline.="%#UtilsInfo#%{mysl#UtilsInfo()}"
  endif

  return s:statusline
endfunction

function! s:StatusLineColor()
  call mysl#SetColors()
endfunction

function! s:SetStatusline()
  let &l:statusline=s:ActiveStatusLine()
  call s:StatusLineColor()
endfunction

function! s:SetInActiveStatusLine()
  let &l:statusline=s:InactiveStatusLine()
  call s:StatusLineColor()
endfunction

augroup MyStatusLine
  autocmd!
  autocmd VimResized,FileType,WinEnter,BufWinEnter,BufReadPost  * call s:SetStatusline()
  autocmd WinLeave * call s:SetInActiveStatusLine()
  autocmd BufNewFile,ShellCmdPost,BufWritePost * call s:SetStatusline()
  autocmd FileChangedShellPost,ColorScheme * call s:SetStatusline()
  autocmd FileReadPre,ShellCmdPost,FileWritePost * call s:SetStatusline()
  autocmd User CocStatusChange,CocGitStatusChange call s:SetStatusline()
  autocmd User CocDiagnosticChange call s:SetStatusline()
augroup END
