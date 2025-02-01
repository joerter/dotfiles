-- return {
--   "nordtheme/vim",
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     -- load the colorscheme here
--     vim.cmd([[colorscheme nord]])
--   end,
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      -- on_colors = function(colors)
      --   colors.fg_gutter = "#ff9e64"
      -- end
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.magenta }
        highlights.LineNrAbove = { fg = colors.magenta }
        highlights.LineNrBelow = { fg = colors.magenta }
      end
    })
    vim.cmd [[colorscheme tokyonight-moon]]
  end
}

-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function ()
--     vim.cmd[[colorscheme solarized-osaka]]
--   end,
-- }
