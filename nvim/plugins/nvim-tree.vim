let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1

nnoremap <leader>ft :NvimTreeToggle<CR>
nnoremap <leader>fr :NvimTreeRefresh<CR>
nnoremap <leader>fn :NvimTreeFindFile<CR>

lua << EOF
  require'nvim-tree'.setup {
      ignore_ft_on_setup  = {'startify', 'dashboard'},
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {'.git'}
      },
      view = {
        width = 50,
        height = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {}
        }
    }
}

require'nvim-tree.view'.View.winopts.relativenumber = true
EOF
