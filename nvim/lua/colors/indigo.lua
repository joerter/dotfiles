-- Indigo Colorscheme

local colors = {
  bg = "#3F3B7D",
  fg = "#FFFFFF",
  gray = "#8785AD",
  light_gray = "#A9A7C7",
  dark_indigo = "#32305E",
  indigo = "#5E5C85",
  green = "#7BC65F",
  yellow = "#FFD700",
  red = "#FF6B6B",
}

-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "Indigo"

-- Set up highlights
local function set_hl(group, colors)
    vim.api.nvim_set_hl(0, group, colors)
end

-- Normal text
set_hl("Normal", { fg = colors.fg, bg = colors.bg })

-- Line numbers
set_hl("LineNr", { fg = colors.gray, bg = colors.bg })

-- Cursor line
set_hl("CursorLine", { bg = colors.dark_indigo })
set_hl("CursorLineNr", { fg = colors.yellow, bg = colors.dark_indigo })

-- Search
set_hl("Search", { fg = colors.dark_indigo, bg = colors.yellow })

-- Status line
set_hl("StatusLine", { fg = colors.fg, bg = colors.indigo })

-- Tabs
set_hl("TabLine", { fg = colors.light_gray, bg = colors.dark_indigo })
set_hl("TabLineFill", { bg = colors.dark_indigo })
set_hl("TabLineSel", { fg = colors.fg, bg = colors.indigo })

-- Syntax highlighting
set_hl("Comment", { fg = colors.gray })
set_hl("Constant", { fg = colors.green })
set_hl("String", { fg = colors.green })
set_hl("Identifier", { fg = colors.light_gray })
set_hl("Function", { fg = colors.yellow })
set_hl("Statement", { fg = colors.indigo })
set_hl("PreProc", { fg = colors.red })
set_hl("Type", { fg = colors.light_gray })
set_hl("Special", { fg = colors.yellow })

-- Additional highlights
set_hl("MatchParen", { fg = colors.yellow, bg = colors.dark_indigo })
set_hl("Pmenu", { fg = colors.fg, bg = colors.dark_indigo })
set_hl("PmenuSel", { fg = colors.dark_indigo, bg = colors.green })

-- Define highlights for different modes
local Indigo = {
  normal = {
    a = { fg = colors.fg, bg = colors.indigo },
    b = { fg = colors.fg, bg = colors.dark_indigo },
    c = { fg = colors.light_gray, bg = colors.bg },
  },
  insert = { a = { fg = colors.dark_indigo, bg = colors.green } },
  visual = { a = { fg = colors.dark_indigo, bg = colors.yellow } },
  replace = { a = { fg = colors.dark_indigo, bg = colors.red } },
}

return Indigo
