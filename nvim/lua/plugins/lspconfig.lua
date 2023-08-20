local lspconfig = require 'lspconfig'
local util = require 'vim.lsp.util'

  -- Setup lspconfig.
lspconfig.tsserver.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
     ["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
         -- Disable virtual_text
         virtual_text = false
       }
     ),
  }
}

lspconfig.clojure_lsp.setup{}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
