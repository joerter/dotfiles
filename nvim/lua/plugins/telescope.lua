local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>pf', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', options)
map('n', '<leader>bb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>/', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>cd', '<cmd>Telescope lsp_definitions<cr>', options)
map('n', '<leader>cD', '<cmd>Telescope lsp_references<cr>', options)
map('n', '<leader>ci', '<cmd>Telescope lsp_implementations<cr>', options)
map('n', '<leader>ct', '<cmd>Telescope lsp_type_definitions<cr>', options)
map('n', '<leader>th', '<cmd>Telescope help_tags<cr>', options)
map('n', '<leader>tj', '<cmd>Telescope jumplist<cr>', options)
map('n', '<leader>tk', '<cmd>Telescope keymaps<cr>', options)
map('n', '<leader>tm', '<cmd>Telescope marks<cr>', options)
map('n', '<leader>tr', '<cmd>Telescope registers<cr>', options)
map('n', '<leader>tt', '<cmd>Telescope tags<cr>', options)

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble
      },
      n = { ["<c-t>"] = trouble.open_with_trouble }
    }
  }
})
