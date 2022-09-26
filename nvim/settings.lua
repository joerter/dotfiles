local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.laststatus = 2
o.scrolloff = 10
o.sidescroll = 1
o.showmatch = true
o.listchars = "tab:▸\ ,eol:¬"
o.foldlevelstart = 99
o.wrapscan = true
o.hlsearch = true
o.incsearch = true
o.wildmenu = true
o.wildignore = o.wildignore + "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*\\tmp\\*,*.swp,*.zip,*.exe,*\\bin\\*,*\\packages\\*,*\\obj\\*,*/node_modules/*" 
o.autoread = true

wo.cursorcolumn = true
wo.cursorline = true
wo.relativenumber = true
wo.number = true
wo.numberwidth = 1
wo.wrap = false
wo.foldmethod = "indent"
wo.foldcolumn = "0"

bo.swapfile = false
bo.syntax = true
bo.tabstop = 2
bo.shiftwidth = 2
bo.softtabstop = 2
bo.expandtab = true
bo.smartindent = true
bo.filetype = "plugin indent on"
