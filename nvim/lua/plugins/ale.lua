vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint', 'tslint'},
}

vim.g.ale_fixers = {
    ['*'] = {'eslint'}
}

