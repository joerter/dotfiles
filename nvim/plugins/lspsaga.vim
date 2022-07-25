" nnoremap <silent><leader>lf :Lspsaga lsp_finder<CR>

nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

vnoremap <silent><leader>cf :Lspsaga lsp_finder<CR>

nnoremap <silent><leader>ch :Lspsaga hover_doc<CR>
nnoremap <silent><leader>ch :Lspsaga preview_definition<CR>
nnoremap <silent><leader>cr :Lspsaga rename<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" show signature help
nnoremap <silent><leader>ls :Lspsaga signature_help<CR>

" rename
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

" print lsp info
nnoremap <leader>li :lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga({
    diagnostic_header = {"🙀", "😿", "😾", "😺"},
})
EOF
