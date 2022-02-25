" nnoremap <silent><leader>lf :Lspsaga lsp_finder<CR>

" nnoremap <silent><leader>lca :Lspsaga code_action<CR>
" vnoremap <silent><leader>lca :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent><leader>lh :Lspsaga hover_doc<CR>

" scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" show signature help
nnoremap <silent><leader>ls :Lspsaga signature_help<CR>

" rename
nnoremap <silent><leader>lr :Lspsaga rename<CR>
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

" print lsp info
nnoremap <leader>li :lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>
