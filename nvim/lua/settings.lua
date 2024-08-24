local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.laststatus = 2
o.scrolloff = 10
o.sidescroll = 1
o.showmatch = true
o.foldlevelstart = 99
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
--wo.foldmethod = "syntax"
--wo.foldcolumn = "0"
wo.colorcolumn = "120"

bo.swapfile = false
bo.syntax = "on"

vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
-- o.tabstop = 4
-- o.shiftwidth = 4
-- o.softtabstop = 4
-- o.expandtab = true
-- o.smartindent = true
--bo.filetype = "plugin indent on"
--o.listchars = "tab:▸\ ,eol:¬"
