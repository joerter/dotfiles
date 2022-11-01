local map = vim.api.nvim_set_keymap
options = { noremap = true }

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<leader>bl', ':BufferLineCycleNext<CR>', options)
map('n', '<leader>bh', ':BufferLineCyclePrev<CR>', options)

map('n', '<leader>bp', ':BufferLinePick<CR>', options)
map('n', '<leader>bdd', ':bdelete<CR>', options)
map('n', '<leader>bdp', ':BufferLinePickClose<CR>', options)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<leader>be', ':BufferLineMoveNext<CR>', options)
map('n', '<leader>by', ':BufferLineMovePrev<CR>', options)

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', '<leader>bse', ':BufferLineSortByExtension<CR>', options)
map('n', '<leader>bsd', ':BufferLineSortByDirectory<CR>', options)

map('n', '<leader>bcr', ':BufferLineCloseRight<CR>', options)
map('n', '<leader>bcl', ':BufferLineCloseLeft<CR>', options)

require("bufferline").setup{}
