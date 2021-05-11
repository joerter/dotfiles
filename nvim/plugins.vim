call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'weynhamz/vim-plugin-minibufexpl'
Plug 'mileszs/ack.vim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorschemes
" Plug 'joshdick/onedark.vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }

" HTML
Plug 'mattn/emmet-vim'

" CSS
" Plug 'groenewege/vim-less'

" JavaScript plugins
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'elzr/vim-json'
Plug 'prettier/vim-prettier'

" Clojure
Plug 'luochen1990/rainbow'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'

" Pug plugins
" Plug 'digitaltoad/vim-pug'

" Ledger
" Plug 'ledger/vim-ledger'

call plug#end()
