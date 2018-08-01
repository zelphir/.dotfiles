" Theme
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" File search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Integration with tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Indent guides
Plug 'Yggdroot/indentLine'

" Improve scroll
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'vim-scripts/RelativeNumberCurrentWindow'

" Fugitive
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

" UI tools
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'

" Aligning
Plug 'tommcdo/vim-lion'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'roxma/nvim-yarp'
Plug 'calebeby/ncm-css'
Plug 'ludovicchabant/vim-gutentags'
Plug 'zoubin/vim-gotofile'

" Tags/braces tools
Plug 'gorkunov/smartpairs.vim'
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascript', 'javascript.jsx'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'javascript', 'javascript.jsx'] }

" Utils
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'shime/vim-livedown'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'javascript.jsx', 'html', 'css', 'scss'] }

" Snippets
Plug 'Shougo/neosnippet.vim'

" Javascript
Plug 'w0rp/ale' " lintiing
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }

" Syntax highlight
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'styled-components/vim-styled-components', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jparise/vim-graphql'
