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
Plug 'brooth/far.vim'

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
Plug 'mattn/emmet-vim', { 'for': ['javascript', 'javascript.jsx', 'typescript.tsx', 'html', 'css', 'scss'] }

" Javascript
Plug 'yardnsm/vim-import-cost', { 'do': 'yarn install' }

" Syntax highlight
Plug 'sheerun/vim-polyglot'
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript.tsx'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }
Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

call plug#end()
