return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      local map = vim.api.nvim_set_keymap
      options = { noremap = true }
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          buffers = {
            path_display = { "tail" }, -- Show only filename, not full path
            previewer = false,         -- Disable preview
            layout_config = {
              height = 0.4,            -- Make the picker smaller
              prompt_position = "top", -- Put prompt at top
            },
            sorting_strategy = "ascending",
            mappings = {
              i = {
                ["<Tab>"] = actions.move_selection_next,
              },
              n = {
                ["<Tab>"] = actions.move_selection_next,
              },
            },
          },
        },
      })

      map("n", "<leader>pf", "<cmd>Telescope find_files<cr>", options)
      map("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", options)
      map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", options)
      map("n", "<leader><Tab>", "<cmd>Telescope buffers sort_mru=true<cr>", options)

      map("n", "<leader>cf", "<cmd>Telescope lsp_references<cr>", options)
      map("n", "<leader>cic", "<cmd>Telescope lsp_incoming_calls<cr>", options)
      map("n", "<leader>coc", "<cmd>Telescope lsp_outgoing_calls<cr>", options)
      map("n", "<leader>cds", "<cmd>Telescope lsp_document_symbols<cr>", options)
      map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<cr>", options)
      map("n", "<leader>ci", "<cmd>Telescope lsp_implementtions<cr>", options)
      map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<cr>", options)

      map("n", "<leader>th", "<cmd>Telescope help_tags<cr>", options)
      map("n", "<leader>jj", "<cmd>Telescope jumplist<cr>", options)
      map("n", "<leader>tk", "<cmd>Telescope keymaps<cr>", options)
      map("n", "<leader>tm", "<cmd>Telescope marks<cr>", options)
      map("n", "<leader>tr", "<cmd>Telescope registers<cr>", options)
      --map("n", "<leader>tt", "<cmd>Telescope tags<cr>", options)
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
