return {
  url = "https://codeberg.org/andyg/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    require("leap").setup({
    })
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
    vim.keymap.set('n', 'S', '<Plug>(leap-backward)')
  end,
}
