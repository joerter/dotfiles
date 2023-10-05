local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<localleader>dr', ':ConjureEval (dev/reload)<CR>', options) -- dev reload
