local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.laststatus = 2
o.scrolloff = 10
o.sidescroll = 1
o.showmatch = true
o.foldlevelstart = 0
o.wrapscan = true
o.hlsearch = true
o.incsearch = true
o.wildmenu = true
o.autoread = true
o.background = "dark"
--vim.cmd[[colorscheme gruvbox]]
-- wo.cursorcolumn = true
-- wo.cursorline = true
wo.relativenumber = true
wo.number = true
wo.numberwidth = 1
wo.wrap = false
wo.foldmethod = "indent"
wo.foldcolumn = "0"
wo.colorcolumn = "120"

bo.swapfile = false
bo.syntax = "on"

vim.api.nvim_set_var('shiftwidth', 4)
vim.api.nvim_set_var('tabstop', 4)
vim.api.nvim_set_var('softtabstop', 4)
vim.api.nvim_set_var('expandtab', true)
vim.api.nvim_set_var('smartindent', true)
-- o.tabstop = 4
-- o.shiftwidth = 4
-- o.softtabstop = 4
-- o.expandtab = true
-- o.smartindent = true
--bo.filetype = "plugin indent on"
--o.listchars = "tab:▸\ ,eol:¬"
