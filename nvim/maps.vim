" Reload vimrc
nnoremap <leader>rv :source ~/.config/nvim/init.vim<CR>

" Getting to normal mode faster
tnoremap jk <C-\><C-n>
inoremap jk <esc>
inoremap jks <esc>:w<CR>

" Sorting
vnoremap <F9> :'<,'>sort u<CR>

" Unhighlight searches
nnoremap <leader><cr> :nohlsearch<CR>

" Using cnext and cprevious
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprevious<cr>

nnoremap <leader>sc :setlocal spell spelllang=en_us<cr>

" toggle whitespace characters
nmap <leader>l :set list!<CR>

" toggle paste mode
nmap <leader>p :set paste!<CR>
