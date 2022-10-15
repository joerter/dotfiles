local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader>ft', ':NvimTreeToggle<CR>', options)
map('n', '<leader>fr', ':NvimTreeRefresh<CR>', options)
map('n', '<leader>ff', ':NvimTreeFindFile<CR>', options)

require'nvim-tree'.setup {
    ignore_ft_on_setup  = {'startify', 'dashboard'},
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {'.git'}
    },
    renderer = {
      highlight_opened_files = 'all',
      highlight_git = true,
    },
    view = {
      width = 50,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {}
      }
  }
}

require'nvim-tree.view'.View.winopts.relativenumber = true
