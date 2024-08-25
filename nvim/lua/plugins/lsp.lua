return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clojure_lsp", "tsserver", "tailwindcss", "lua_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("vim.lsp.util")

      local function ts_organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end
      lspconfig.tsserver.setup({
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(
        -- 	vim.lsp.protocol.make_client_capabilities()
        -- ),
        handlers = {
          ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            -- Disable virtual_text
            virtual_text = false,
          }),
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_create_user_command(
            "TsserverOrganizeImports",
            ts_organize_imports,
            { desc = "Organize Imports" }
          )
        end,
      })

      lspconfig.clojure_lsp.setup({
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(
        -- 	vim.lsp.protocol.make_client_capabilities()
        -- ),
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<leader>fr", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true })
        end,
      })

      lspconfig.tailwindcss.setup({
        -- capabilities = require("cmp_nvim_lsp").default_capabilities(
        -- 	vim.lsp.protocol.make_client_capabilities()
        -- ),
      })

      lspconfig.lua_ls.setup({})
      lspconfig.fennel_ls.setup({})

      lspconfig.terraformls.setup({})
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = { "*.tf", "*.tfvars" },
        callback = function()
          vim.lsp.buf.format()
        end,
      })
      local map = vim.api.nvim_set_keymap
      options = { noremap = true }

      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      --map("n", "<leader>ca", ":Lspsaga code_action<CR>", options)
      --map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", options)
      map("n", "<leader>cl", ":Lspsaga show_line_diagnostics<CR>", options)
      map("n", "<leader>cb", ":Lspsaga show_buf_diagnostics<CR>", options)
      map("n", "<leader>cr", ":Lspsaga rename<CR>", options)
      map("n", "<leader>cs", ":Lspsaga signature_help<CR>", options)
      map("n", "<leader>cp", ":Lspsaga peek_definition<CR>", options)
    end,
  },
}
-- dependencies = {
--
--
--   "hrsh7th/cmp-nvim-lsp",
--   "hrsh7th/nvim-cmp",
--   "hrsh7th/vim-vsnip",
--   "hrsh7th/cmp-buffer",
--   "hrsh7th/cmp-path",
--   "hrsh7th/cmp-cmdline",
--   "hrsh7th/cmp-vsnip",
--   "nvimdev/lspsaga.nvim",
-- },
-- init = function()

-- end,
