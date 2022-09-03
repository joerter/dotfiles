  " on_attach = function(client, bufnr)
  "   if client.supports_method("textDocument/formatting") then
  "     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  "     vim.api.nvim_create_autocmd("BufWritePre", {
  "       group = augroup,
  "       buffer = bufnr,
  "       callback = function()
  "         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
  "         vim.lsp.buf.formatting_sync()
  "       end,
  "       })
  "     end
  " end,
" lspconfig['prettier'].setup {
"   on_attach = function(client, bufnr)
"     formatting_callback(client, bufnr)
"   end
" }
" require("mason").setup()
" require("mason-lspconfig").setup()
" lspconfig['eslint'].setup {
"   handlers = {
"      ["textDocument/publishDiagnostics"] = vim.lsp.with(
"        vim.lsp.diagnostic.on_publish_diagnostics, {
"          -- Disable virtual_text
"          virtual_text = false
"        }
"      ),
"   }
" }

lua << EOF
local lspconfig = require 'lspconfig'
local null_ls = require 'null-ls'
local util = require 'vim.lsp.util'

local formatting_callback = function(client, bufnr)
  vim.keymap.set('n', '<leader>fr', function()
    local params = util.make_formatting_params({})
    client.request('textDocument/formatting', params, nil, bufnr) 
  end, {buffer = bufnr})
end

null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint.with({
      prefer_local = true
    }),
    null_ls.builtins.formatting.prettier.with({
      prefer_local = true
    })
  },
  on_attach = function (client, bufnr)
    formatting_callback(client, bufnr)
  end
})

-- Setup lspconfig.
lspconfig.tsserver.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
     ["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
         -- Disable virtual_text
         virtual_text = false
       }
     ),
  }
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
EOF
