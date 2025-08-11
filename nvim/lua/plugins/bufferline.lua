return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {},
  config = function()
    require('bufferline').setup({
      options = {
        groups = {
          options = {
            toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          },
          items = {
            {
              name = "Tests",                 -- Laravel Tests
              highlight = { sp = "#bb9af7" }, -- Purple from Tokyo Night
              priority = 1,
              icon = "󰙨 ",
              matcher = function(buf)
                return buf.path:match('/tests/') or buf.path:match('Test.php$')
              end,
            },
            {
              name = "Models",
              highlight = { sp = "#ff9e64" }, -- Orange
              priority = 2,
              icon = "󰆧 ",
              matcher = function(buf)
                return buf.path:match('/Models/') and buf.path:match('%.php$')
              end,
            },
            {
              name = "Controllers",           -- Laravel Controllers
              highlight = { sp = "#7dcfff" }, -- Light blue from Tokyo Night
              priority = 3,
              icon = "󰡰 ",
              matcher = function(buf)
                return buf.path:match('/Controllers/') or buf.path:match('Controller.php$')
              end,
            },
            {
              name = "Services",
              highlight = { sp = "#f7768e" }, -- Red
              priority = 4,
              icon = "󰚇 ",
              matcher = function(buf)
                return buf.path:match('/Services/') or buf.path:match('Service.php$')
              end,
            },
            {
              name = "React",
              highlight = { sp = "#9ece6a" }, -- Green from Tokyo Night
              priority = 5,
              icon = "󰜈 ",
              matcher = function(buf)
                return buf.path:match('%.jsx$') or buf.path:match('%.tsx$') or buf.path:match('/components/')
              end,
            },
            {
              name = "Terraform",
              highlight = { sp = "#7B42BC" }, -- Terraform's brand purple color
              priority = 6,
              icon = "󱁢 ", -- Terraform-specific icon
              matcher = function(buf)
                return buf.path:match('%.tf$') or buf.path:match('%.tfvars$') or buf.path:match('%.hcl$')
              end,
            },
            {
              name = "GH Actions",
              highlight = { sp = "#2088FF" }, -- GitHub Actions blue
              priority = 7, -- Assuming you want it after Terraform
              icon = "󰡯 ", -- Workflows icon
              matcher = function(buf)
                return buf.path:match('%.github/workflows/.*%.ya?ml$') -- Matches .yml or .yaml in .github/workflows
              end,
            },
            {
              name = "admin",
              highlight = { sp = "#bb9af7" }, -- Purple from Tokyo Night
              priority = 8,
              icon = "󰋔 ", -- Admin/dashboard icon
              matcher = function(buf)
                return buf.path:match('entouch%-admin')
              end,
            },
            {
              name = "legacy-services",
              highlight = { sp = "#ff9e64" }, -- Orange from Tokyo Night
              priority = 9,
              icon = "󰡱 ", -- Services icon
              matcher = function(buf)
                return buf.path:match('entouch%-legacy%-services')
              end,
            },
            {
              name = "rest",
              highlight = { sp = "#7dcfff" }, -- Light blue from Tokyo Night
              priority = 10,
              icon = "󰘌 ", -- API/endpoints icon
              matcher = function(buf)
                return buf.path:match('entouch%-rest')
              end,
            },
            {
              name = "server",
              highlight = { sp = "#f7768e" }, -- Red from Tokyo Night
              priority = 11,
              icon = "󰅡 ", -- Server icon
              matcher = function(buf)
                return buf.path:match('entouch%-server')
              end,
            },
            {
              name = "types",
              highlight = { sp = "#9ece6a" }, -- Green from Tokyo Night
              priority = 12,
              icon = "󰊄 ", -- Types/interface icon
              matcher = function(buf)
                return buf.path:match('entouch%-types')
              end,
            },
          }
        }
      }

    })
    local map = vim.api.nvim_set_keymap
    options = { noremap = true }

    map("n", "<leader>bp", ":BufferLinePick<cr>", options)
    map("n", "<leader>bcp", ":BufferLinePickClose<cr>", options)
    map("n", "<leader>bco", ":BufferLineCloseOthers<cr>", options)
    map("n", "<leader>bcl", ":BufferLineCloseLeft<cr>", options)
    map("n", "<leader>bcr", ":BufferLineCloseRight<cr>", options)
    map("n", "<leader>bo", ":BufferLineSortByDirectory<cr>", options)
  end,
}
