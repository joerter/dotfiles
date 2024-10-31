return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local map = vim.api.nvim_set_keymap
    options = { noremap = true }

    require("neo-tree").setup({
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        statusline = false,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
        },
      },
      window = {
        mappings = {
          ["o"] = "open",
        },
      },
    })

    map("n", "<leader>ft", ":Neotree show filesystem left toggle<CR>", options)
    map("n", "<leader>ff", ":Neotree reveal<CR>", options)
  end,
}
