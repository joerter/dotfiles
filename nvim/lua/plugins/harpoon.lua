local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', options)
map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<cr>', options)
map('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<cr>', options)
map('n', '<leader>hp', ':lua require("harpoon.ui").nav_prev()<cr>', options)
