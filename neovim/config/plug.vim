if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Theme
Plug 'mhartington/oceanic-next', { 'as': 'oceanicnext' }

" File search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Integration with tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Improve scroll
Plug 'vim-scripts/CursorLineCurrentWindow'
Plug 'vim-scripts/RelativeNumberCurrentWindow'

" UI/Tools
Plug 'mhinz/vim-signify'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'

Plug 'scrooloose/nerdtree'
Plug 'albfan/nerdtree-git-plugin'

" Autocomplete
Plug 'neoclide/coc.nvim', { 'do': 'yarn install' }

" Tags/braces tools
Plug 'gorkunov/smartpairs.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
Plug 'Valloric/MatchTagAlways'
Plug 'wellle/targets.vim'
Plug 'cohama/lexima.vim'

" Utils
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'wakatime/vim-wakatime'
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'javascript.jsx', 'html', 'css', 'scss'] }

" Go
" Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }

" Javascript
Plug 'yardnsm/vim-import-cost', { 'do': 'yarn install' }

" Syntax highlight
Plug 'sheerun/vim-polyglot'
" Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.jsx'] }
" Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'javascript.jsx'] }
Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx'] }

call plug#end()
