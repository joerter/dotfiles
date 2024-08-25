return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    require("mini.basics").setup()
    require("mini.comment").setup()
    require("mini.indentscope").setup()
    require("mini.pairs").setup()
    require("mini.statusline").setup()
  end,
}
