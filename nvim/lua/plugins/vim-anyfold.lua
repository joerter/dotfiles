-- Enable filetype detection, plugin, and indent
vim.cmd('filetype plugin indent on')

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Activate AnyFold for all filetypes
vim.api.nvim_create_autocmd('Filetype', {
  pattern = '*',
  command = 'AnyFoldActivate'
})

-- Alternatively, activate AnyFold for a specific filetype
-- Uncomment and replace <your-filetype> with the desired filetype
-- vim.api.nvim_create_autocmd('Filetype', {
--   pattern = '<your-filetype>',
--   command = 'AnyFoldActivate'
-- })

-- Set fold level (uncomment one of the following lines)
vim.opt.foldlevel = 0  -- Close all folds
--vim.opt.foldlevel = 99 -- Open all folds
