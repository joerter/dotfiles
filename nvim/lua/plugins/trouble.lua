local map = vim.api.nvim_set_keymap
options = { noremap = true }
map('n', '<leader>tt', ':TroubleToggle<cr>', options)

require("trouble").setup {
  signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "﫠"
  },
}
