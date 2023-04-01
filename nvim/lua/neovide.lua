local map = vim.api.nvim_set_keymap
options = { noremap = true }

if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

   map('t', '<C-space>', '<C-\\><C-N>', options)

  -- map('t', '<C-space>wd', '<C-\\><C-N>:hide<CR>', options)

  -- map('t', '<C-space>w%', '<C-\\><C-N>:vsplit<CR>', options)
  -- map('t', '<C-space>wv', '<C-\\><C-N>:vsplit<CR>', options)

  -- map('t', '<C-space>w"', '<C-\\><C-N>:split<CR>', options)
  -- map('t', '<C-space>ws', '<C-\\><C-N>:split<CR>', options)
  -- map('t', '<C-space>wz', '<C-\\><C-N><C-w>|<CR><C-w>_<CR>', options)
  -- map('t', '<C-space>w=', '<C-\\><C-N><C-w>=', options)

  -- map('t', '<C-space>wj', '<C-\\><C-N><C-w>j', options)
  -- map('t', '<C-space>wh', '<C-\\><C-N><C-w>h', options)
  -- map('t', '<C-space>wk', '<C-\\><C-N><C-w>k', options)
  -- map('t', '<C-space>wl', '<C-\\><C-N><C-w>l', options)
end

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

