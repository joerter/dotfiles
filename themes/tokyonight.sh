# Theme: TokyoNight Moon
NVIM_PLUGIN="folke/tokyonight.nvim"
NVIM_COLORSCHEME="tokyonight-moon"
NVIM_CONFIG='require("tokyonight").setup({
      style = "moon",
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = colors.magenta }
        highlights.LineNrAbove = { fg = colors.magenta }
        highlights.LineNrBelow = { fg = colors.magenta }

        highlights.MsgArea = { bg = colors.bg_dark, fg = colors.green, bold = true } -- Command line area
      end
    })'
GHOSTTY_THEME="TokyoNight Moon"
TMUX_THEME_PLUGIN=""
ZSH_THEME_NAME="tokyo-night"
