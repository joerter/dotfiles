return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.magenta }
        highlights.LineNrAbove = { fg = colors.magenta }
        highlights.LineNrBelow = { fg = colors.magenta }

        highlights.MsgArea = { bg = colors.bg_dark, fg = colors.green, bold = true } -- Command line area
      end
    })
    vim.cmd [[colorscheme tokyonight-moon]]
  end
}
