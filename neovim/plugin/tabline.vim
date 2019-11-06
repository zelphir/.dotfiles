if exists("g:mytl_loaded")
  finish
endif

let g:mytl_loaded = 1

let g:mytl_always_show_tabline = 1
let g:mytl_noseparator = ""
let g:mytl_separator = ""
let g:mytl_max_plug = get(g:, "mytl_max_plug", 10)
let g:mytl_use_devicons = 1
let g:mytl_modified_icon = " "
let g:mytl_left_trunc_icon = ""
let g:mytl_right_trunc_icon = ""
let g:mytl_new_buffer_name = "*"
let g:mytl_tab_icon = "﬘"

let g:mytl_prefix = "Mytl"
let g:mytl_has_separator = {
      \     "Tab": {
      \         "Tab": g:mytl_separator,
      \         "LeftTrunc": g:mytl_separator,
      \         "End" : g:mytl_separator,
      \     },
      \     "LeftTrunc": {
      \         "Buffer": g:mytl_separator,
      \         "CurrentBuffer": g:mytl_separator,
      \         "ActiveBuffer": g:mytl_separator,
      \         "ModBuffer": g:mytl_separator,
      \     },
      \     "RightTrunc": {
      \         "Tab": g:mytl_separator,
      \         "End": g:mytl_separator,
      \     },
      \ }

let g:mytl_buffer_types = [
      \    "Buffer",
      \    "ActiveBuffer",
      \    "CurrentBuffer",
      \    "ModBuffer",
      \    "ModActiveBuffer",
      \    "ModCurrentBuffer",
      \ ]

for s:type in g:mytl_buffer_types
  let g:mytl_has_separator["Tab"][s:type] = g:mytl_separator
  let g:mytl_has_separator[s:type] = {
        \     "RightTrunc": g:mytl_separator,
        \     "Tab": g:mytl_separator,
        \     "End": g:mytl_separator,
        \ }

  for s:t in g:mytl_buffer_types
    let g:mytl_has_separator[s:type][s:t] = g:mytl_separator
  endfor
endfor

function! s:GetHiAttr(name, attr)
  let vim_mode = "cterm"
  let attr_suffix = ""
  if has("gui")
    let vim_mode = "gui"
    let attr_suffix = "#"
  endif

  let value = synIDattr(synIDtrans(hlID(a:name)), a:attr . attr_suffix, vim_mode)

  return value
endfunction

function! s:SetHi(name, fg, bg)
  let vim_mode = "cterm"
  if has("gui")
    let vim_mode = "gui"
  endif

  let spec = ""
  if a:fg != ""
    let fg_spec = vim_mode . "fg=" . a:fg
    let spec = fg_spec
  endif

  if a:bg != ""
    let bg_spec = vim_mode . "bg=" . a:bg

    if spec != ""
      let bg_spec = " " . bg_spec
    endif

    let spec = spec . bg_spec
  endif

  if spec != ""
    exec "silent hi! " . a:name . " " . spec
  endif
endfunction

function! s:LinkHi(name, target)
  exec "silent hi! link " . a:name . " " . a:target
endfunction

function! s:SetColors()
  exe 'hi! MytlTab guibg='.g:base00.' guifg='.g:base04
  exe 'hi! MytlBuffer guibg='.g:base01.' guifg='.g:base03
  exe 'hi! MytlModBuffer guibg='.g:base01.' guifg='.g:base0A
  exe 'hi! MytlCurrentBuffer guibg='.g:base0C.' guifg='.g:base00d
  exe 'hi! MytlModCurrentBuffer guibg='.g:base0A.' guifg='.g:base00
  exe 'hi! MytlActiveBuffer guibg='.g:base00.' guifg='.g:base0C
  exe 'hi! MytlTrunc guibg='.g:base00.' guifg='.g:base07

  hi! link MytlModActiveBuffer MytlActiveBuffer
  hi! link MytlLeftTrunc MytlTrunc
  hi! link MytlRightTrunc MytlTrunc
  hi! link MytlEnd MytlBuffer

  if exists("*g:MytlSetCustomColors")
    call g:MytlSetCustomColors()
  endif

  for left in keys(g:mytl_has_separator)
    for right in keys(g:mytl_has_separator[left])
      let vim_mode = "cterm"
      if has("gui")
        let vim_mode = "gui"
      endif

      let left_hi = g:mytl_prefix . left
      let right_hi = g:mytl_prefix . right
      let left_bg = s:GetHiAttr(left_hi, 'bg')
      let right_bg = s:GetHiAttr(right_hi, 'bg')

      if left_bg == ""
        let left_bg = "NONE"
      endif

      if right_bg == ""
        let right_bg = "NONE"
      endif

      let sep_hi = g:mytl_prefix . left . right
      if left_bg != right_bg
        let g:mytl_has_separator[left][right] = g:mytl_noseparator

        call s:SetHi(sep_hi, left_bg, right_bg)
      else
        let g:mytl_has_separator[left][right] = g:mytl_separator

        call s:LinkHi(sep_hi, left_hi)
      endif
    endfor
  endfor
endfunction

augroup mytl_set_colors
  autocmd!
  autocmd ColorScheme * call s:SetColors()
augroup end

" Set solors also at the startup
call s:SetColors()

if has("nvim")
  function! SwitchToBuffer(buffer_id, clicks, btn, flags)
    exec "silent buffer " . a:buffer_id
  endfunction
endif

let g:mytl_bwipe_filters = [""]

for s:n in range(1, g:mytl_max_plug)
  execute printf("noremap <silent> <Plug>MytlSwitch(%d) :call mytl#bswitch(%d)<cr>", s:n, s:n)
endfor

command! -bang -complete=buffer -nargs=? Bw call mytl#bwipe(<q-bang>, <q-args>)
command! -bang -complete=buffer -nargs=? Bonly call mytl#bonly(<q-bang>, <q-args>)

set tabline=%!mytl#render()

