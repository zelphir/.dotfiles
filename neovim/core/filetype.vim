augroup MyAutoCmd

  " Reload vim config automatically
  let $NEOVIMPATH = resolve(expand($NVIM_HOME))
  autocmd BufWritePost $NEOVIMPATH/{*.vim,*.toml} nested
        \ source $MYVIMRC

  autocmd WinEnter,InsertLeave * set cursorline

  autocmd WinLeave,InsertEnter * set nocursorline

  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

  autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

  " autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

  " autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat

  " autocmd FileType json syntax match Comment +\/\/.\+$+

  " Go (Google)
  autocmd FileType go let b:coc_pairs_disabled = ['<']

  " set filetypes as typescript && tsx
  " autocmd BufNewFile,BufRead *.ts  set filetype=typescript
  " autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

  " HTML (.gohtml and .tpl for server side)
  autocmd BufNewFile,BufRead *.html,*.htm,*.gohtml,*.tpl  setf html
  " Magit
  " autocmd User VimagitEnterCommit startinsert
  "
  " set js filetypes as typescript.tsx
  " autocmd BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescript.tsx

  " https://webpack.js.org/guides/development/#adjusting-your-text-editor
  " autocmd FileType css,javascript,jsx,javascript.jsx,typescript.tsx setlocal backupcopy=yes

  autocmd BufRead,BufNewFile,BufReadPre,FileReadPre .env.* set filetype=sh
  autocmd BufRead,BufNewFile,BufReadPre,FileReadPre *.tmux.conf set filetype=tmux

  " Comment highlighting for jsoc
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END
