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
  opts = {},
  config = function() vim.cmd [[colorscheme tokyonight-moon]] end,
  on_highlights = function(highlights, colors)
    highlights.LineNr = { fg = colors.orange }
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
