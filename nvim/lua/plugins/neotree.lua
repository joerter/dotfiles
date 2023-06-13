local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>ft', ':NeoTreeShowToggle<CR>', options)
map('n', '<leader>ff', ':NeoTreeRevealToggle<CR>', options)

require("neo-tree").setup({
    source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
        },
    }
})
