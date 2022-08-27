" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><leader>bl :BufferLineCycleNext<CR>
nnoremap <silent><leader>bh :BufferLineCyclePrev<CR>

nnoremap <silent><leader>bp :BufferLinePick<CR>
nnoremap <silent><leader>bdd :bdelete<CR>
nnoremap <silent><leader>bdp :BufferLinePickClose<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>be :BufferLineMoveNext<CR>
nnoremap <silent><leader>by :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent><leader>bse :BufferLineSortByExtension<CR>
nnoremap <silent><leader>bsd :BufferLineSortByDirectory<CR>

nnoremap <silent><leader>bcr :BufferLineCloseRight<CR>
nnoremap <silent><leader>bcl :BufferLineCloseLeft<CR>


lua << EOF
require("bufferline").setup{}
EOF
