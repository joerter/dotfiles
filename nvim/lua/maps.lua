local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


options = { noremap = true }
map('i', 'jk', '<esc>', options)
map('i', 'jks', '<esc>:w<CR>', options)

-- windows
map('n', '<leader>wd', ':hide<CR>', options)

map('n', '<leader>w%', ':vsplit<CR>', options)
map('n', '<leader>wv', ':vsplit<CR>', options)

map('n', '<leader>w"', ':split<CR>', options)
map('n', '<leader>ws', ':split<CR>', options)

map('n', '<leader>wj', '<C-w>j', options)
map('n', '<leader>wh', '<C-w>h', options)
map('n', '<leader>wk', '<C-w>k', options)
map('n', '<leader>wl', '<C-w>l', options)

-- files
map('n', '<leader>fs', ':w<CR>', options)


map('v', '<F9>', ':\'<,\'>sort u<CR>', options)
map('n', '<leader><cr>', ':nohlsearch<CR>', options)
