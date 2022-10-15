local map = vim.api.nvim_set_keymap
options = { noremap = true }

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
map('n', '<silent><leader>bl', ':BufferLineCycleNext<CR>', options)
map('n', '<silent><leader>bh', ':BufferLineCyclePrev<CR>', options)

map('n', '<silent><leader>bp', ':BufferLinePick<CR>', options)
map('n', '<silent><leader>bdd', ':bdelete<CR>', options)
map('n', '<silent><leader>bdp', ':BufferLinePickClose<CR>', options)

-- These commands will move the current buffer backwards or forwards in the bufferline
map('n', '<silent><leader>be', ':BufferLineMoveNext<CR>', options)
map('n', '<silent><leader>by', ':BufferLineMovePrev<CR>', options)

-- These commands will sort buffers by directory, language, or a custom criteria
map('n', '<silent><leader>bse', ':BufferLineSortByExtension<CR>', options)
map('n', '<silent><leader>bsd', ':BufferLineSortByDirectory<CR>', options)

map('n', '<silent><leader>bcr', ':BufferLineCloseRight<CR>', options)
map('n', '<silent><leader>bcl', ':BufferLineCloseLeft<CR>', options)

require("bufferline").setup{}
