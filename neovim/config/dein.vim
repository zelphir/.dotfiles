" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('mhartington/oceanic-next')

  " File search
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')

  " " Integration with tmux
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tmux-plugins/vim-tmux-focus-events')

  " Indent guides
  call dein#add('Yggdroot/indentLine')

  " " Improve scroll
  " Plug 'vim-scripts/CursorLineCurrentWindow'
  " Plug 'vim-scripts/RelativeNumberCurrentWindow'

  " Fugitive
  call dein#add('tpope/vim-fugitive')

  " UI tools
  call dein#add('tpope/vim-eunuch')
  call dein#add('vim-airline/vim-airline')
  call dein#add('mhinz/vim-startify')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('terryma/vim-multiple-cursors')

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
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('zoubin/vim-gotofile')
  call dein#add('ncm2/ncm2-tern',  {'build': 'npm install'})
  " Plug 'calebeby/ncm-css'

  " Tags/braces tools
  call dein#add('gorkunov/smartpairs.vim')
  call dein#add('alvan/vim-closetag', { 'on_ft': ['html', 'javascript', 'javascript.jsx'] })
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
  call dein#add('Valloric/MatchTagAlways', { 'on_ft': ['html', 'javascript', 'javascript.jsx'] })

  " Utils
  call dein#add('haya14busa/dein-command.vim')
  call dein#add('tpope/vim-repeat')
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('tpope/vim-commentary')
  call dein#add('matze/vim-move')
  " Plug 'shime/vim-livedown'
  call dein#add('wakatime/vim-wakatime')
  call dein#add('mattn/emmet-vim', { 'on_ft': ['javascript', 'javascript.jsx', 'html', 'css', 'scss'] })

  " Snippets
  call dein#add('Shougo/neosnippet.vim')

  " Javascript
  call dein#add('w0rp/ale') " linter
  call dein#add('ternjs/tern_for_vim', { 'on_ft': ['javascript', 'javascript.jsx'] })

  " Syntax highlight
  " Plug 'sheerun/vim-polyglot'
  " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'leafgarland/typescript-vim'
  " Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'javascript.jsx'] }
  " Plug 'jparise/vim-graphql'

  call dein#end()
  call dein#save_state()
endif
