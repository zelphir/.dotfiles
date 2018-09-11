" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('mhartington/oceanic-next')

  " File search
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')

  " Integration with tmux
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " Improve scroll
  call dein#add('vim-scripts/CursorLineCurrentWindow')
  call dein#add('vim-scripts/RelativeNumberCurrentWindow')

  " UI/Tools
  call dein#add('Yggdroot/indentLine')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-eunuch')
  call dein#add('vim-airline/vim-airline')
  call dein#add('mhinz/vim-startify')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  " Aligning
  call dein#add('tommcdo/vim-lion')

  " Autocomplete
  call dein#add('roxma/nvim-yarp')
  call dein#add('ncm2/ncm2')
  call dein#add('ncm2/ncm2-tmux')
  call dein#add('ncm2/ncm2-github')
  call dein#add('ncm2/ncm2-path')
  call dein#add('ncm2/ncm2-bufword')
  call dein#add('ncm2/ncm2-tagprefix')
  call dein#add('ncm2/ncm2-cssomni')
  call dein#add('ncm2/ncm2-html-subscope')
  call dein#add('ncm2/ncm2-markdown-subscope')
  call dein#add('ncm2/ncm2-ultisnips')
  call dein#add('ncm2/ncm2-tern', {'build': 'npm install'})
  call dein#add('wellle/tmux-complete.vim')
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('zoubin/vim-gotofile')

  " Tags/braces tools
  call dein#add('gorkunov/smartpairs.vim')
  call dein#add('alvan/vim-closetag', { 'on_ft': ['html', 'javascript', 'javascript.jsx'] })
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
  call dein#add('Valloric/MatchTagAlways', { 'on_ft': ['html', 'javascript', 'javascript.jsx'] })
  call dein#add('wellle/targets.vim')

  " Utils
  call dein#add('w0rp/ale')
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('matze/vim-move')
  call dein#add('wakatime/vim-wakatime')
  call dein#add('mattn/emmet-vim', { 'on_ft': ['javascript', 'javascript.jsx', 'html', 'css', 'scss'] })

  " Snippets
  call dein#add('SirVer/ultisnips')

  " Javascript
  call dein#add('ternjs/tern_for_vim', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('posva/vim-vue')
  call dein#add('Galooshi/vim-import-js')

  " Syntax highlight
  call dein#add('sheerun/vim-polyglot')
  call dein#add('pangloss/vim-javascript', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('leafgarland/typescript-vim')
  call dein#add('maxmellon/vim-jsx-pretty', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('styled-components/vim-styled-components', { 'on_ft': ['javascript', 'javascript.jsx'] })
  call dein#add('jparise/vim-graphql')

  call dein#end()
  call dein#save_state()
endif
