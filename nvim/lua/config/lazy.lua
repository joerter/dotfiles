-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local map = vim.api.nvim_set_keymap
local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.laststatus = 3
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
wo.relativenumber = true
wo.number = true
wo.numberwidth = 1
wo.wrap = false
--wo.colorcolumn = "120"

bo.swapfile = false
bo.syntax = "on"

vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

-- local leader
vim.g.maplocalleader = ','  -- 'vim.g' sets global variables

options = { noremap = true }
map('i', 'jk', '<esc>', options)
map('i', 'jks', '<esc>:w<CR>', options)

-- windows
map('n', '<leader>wd', ':hide<CR>', options)

map('n', '<leader>w%', ':vsplit<CR>', options)
map('n', '<leader>wv', ':vsplit<CR>', options)

map('n', '<leader>w"', ':split<CR>', options)
map('n', '<leader>ws', ':split<CR>', options)
map('n', '<leader>wz', '<C-w>|<CR><C-w>_<CR>', options)
map('n', '<leader>w=', '<C-w>=', options)

map('n', '<leader>wj', '<C-w>j', options)
map('n', '<leader>wh', '<C-w>h', options)
map('n', '<leader>wk', '<C-w>k', options)
map('n', '<leader>wl', '<C-w>l', options)

-- files
map('n', '<leader>fs', ':w<CR>', options)

map('v', '<F9>', ':\'<,\'>sort u<CR>', options)
map('n', '<leader><cr>', ':nohlsearch<CR>', options)
map('n', '<leader>fp', ':let @+ = expand("%:p")<CR>', options)

-- misc
map('n', '*', '*N', options)

-- buffers
map('n', '<leader>bco', ':%bd|e#|bd#<CR>', options)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = false, notify = false },
})
