local map = vim.api.nvim_set_keymap
options = { noremap = true }

require("bufferline").setup{}

map('n', '<leader>bp', ':BufferLinePick<cr>', options)

