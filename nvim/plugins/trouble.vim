nnoremap <leader>tt :TroubleToggle<cr>

lua << EOF
  require("trouble").setup {
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
  }
EOF
