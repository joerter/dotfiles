vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
}

vim.g.ale_fixers = {
    ['*'] = {'eslint'}
}

