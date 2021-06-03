" Create a new buffer
nnoremap <leader>bn :e

" go to next buffer
nnoremap <leader>bl :bnext<cr>
" go to previous buffer
nnoremap <leader>bh :bprevious<CR>

" close the current buffer and switch to previous buffer
nnoremap <leader>bd :bp <bar> bd #<cr>
" close all buffers
nnoremap <leader>ba :bufdo bd<cr>
" closse some buffers
nnoremap <leader>bc :bdelete 

" show all buffers
nnoremap <leader>bb :buffers<cr>:b

" open a buffer
nnoremap <leader>bo :buffer 
