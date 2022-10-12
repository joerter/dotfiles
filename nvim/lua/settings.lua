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
vim.cmd[[colorscheme dracula]]

wo.cursorcolumn = true
wo.cursorline = true
wo.relativenumber = true
wo.number = true
wo.numberwidth = 1
wo.wrap = false
wo.foldmethod = "indent"
wo.foldcolumn = "0"

bo.swapfile = false
bo.syntax = "on"
bo.tabstop = 2
bo.shiftwidth = 2
bo.softtabstop = 2
bo.expandtab = true
bo.smartindent = true
--bo.filetype = "plugin indent on"
--o.listchars = "tab:▸\ ,eol:¬"
--o.wildignore = o.wildignore + "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*\\tmp\\*,*.swp,*.zip,*.exe,*\\bin\\*,*\\packages\\*,*\\obj\\*,*/node_modules/*" 
