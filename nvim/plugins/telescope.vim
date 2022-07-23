nnoremap <leader>pf <cmd>Telescope find_files<cr>

nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

nnoremap <leader>bb <cmd>Telescope buffers<cr>

nnoremap <leader>/ <cmd>Telescope live_grep<cr>

nnoremap <leader>cd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>cD <cmd>Telescope lsp_references<cr>

nnoremap <leader>ci <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>ct <cmd>Telescope lsp_type_definitions<cr>

nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tj <cmd>Telescope jumplist<cr>
nnoremap <leader>tk <cmd>Telescope keymaps<cr>
nnoremap <leader>tm <cmd>Telescope marks<cr>
nnoremap <leader>tr <cmd>Telescope registers<cr>
nnoremap <leader>tt <cmd>Telescope tags<cr>

lua <<EOF
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  }
})
EOF
