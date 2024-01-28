local lspconfig = require 'lspconfig'
local util = require 'vim.lsp.util'

local function ts_organize_imports()
  local params = { command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" }
  vim.lsp.buf.execute_command(params)
end

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clojure_lsp", "tsserver", "tailwindcss" }
})

  -- Setup lspconfig.
lspconfig.tsserver.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
     ["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
         -- Disable virtual_text
         virtual_text = false
       }
     ),
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_user_command("TsserverOrganizeImports", ts_organize_imports, {desc = 'Organize Imports'})
  end
})

lspconfig.clojure_lsp.setup({
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>fr', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true })
  end,
})

lspconfig.tailwindcss.setup({})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
