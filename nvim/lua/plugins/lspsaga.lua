local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>ca', ':Lspsaga code_action<CR>', options)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', options)
map('n', '<leader>cf', ':Lspsaga lsp_finder<CR>', options)
map('n', '<leader>ch', ':Lspsaga hover_doc<CR>', options)
map('n', '<leader>cl', ':Lspsaga show_line_diagnostics<CR>', options)
map('n', '<leader>cr', ':Lspsaga rename<CR>', options)
map('n', '<leader>cs', ':Lspsaga signature_help<CR>', options)

-- scroll down hover doc or scroll in definition preview
-- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- scroll up hover doc
-- nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

-- rename
-- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

-- print lsp info
-- nnoremap <leader>li :lua print(vim.inspect(vim.lsp.buf_get_clients()))<CR>
