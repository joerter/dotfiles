local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<localleader>dr', ':ConjureEval (dev/reload)<CR>', options) -- dev reload
map('n', '<localleader>dt', ':ConjureEval (run-tests)<CR>', options) -- dev run tests
