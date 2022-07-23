nnoremap <leader>ft :NvimTreeToggle<CR>
nnoremap <leader>fr :NvimTreeRefresh<CR>
nnoremap <leader>ff :NvimTreeFindFile<CR>

lua << EOF
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
        height = 30,
        side = 'left',
        mappings = {
          custom_only = false,
          list = {}
        }
    }
}

require'nvim-tree.view'.View.winopts.relativenumber = true
EOF
