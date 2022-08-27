" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
nmap <leader>py <Plug>(PrettierAsync)
