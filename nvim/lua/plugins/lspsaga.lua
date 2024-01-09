local map = vim.api.nvim_set_keymap
options = { noremap = true }

require("lspsaga").setup {
    lightbulb = {
        enable = false,
    },
}

map('n', '<leader>ca', ':Lspsaga code_action<CR>', options)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', options)
map('n', '<leader>ch', ':Lspsaga hover_doc<CR>', options)
map('n', '<leader>cl', ':Lspsaga show_line_diagnostics<CR>', options)
map('n', '<leader>cb', ':Lspsaga show_buf_diagnostics<CR>', options)
map('n', '<leader>cr', ':Lspsaga rename<CR>', options)
map('n', '<leader>cs', ':Lspsaga signature_help<CR>', options)
map('n', '<leader>cp', ':Lspsaga peek_definition<CR>', options)
