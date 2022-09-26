local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


options = { noremap = true }
map('i', 'jk', '<esc>', options)
map('i', 'jks', '<esc>:w<CR>', options)

map('v', '<F9>', ':'<,'>sort u<CR>', options)

map('n', '<leader><cr>', ':nohlsearch<CR>', options)


