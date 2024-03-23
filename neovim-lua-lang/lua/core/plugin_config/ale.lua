vim.g.ale_linters = { ['python'] = {'ruff'} }

vim.g.ale_fixers = {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    ['python'] = { 'black', 'ruff' }
}

vim.g.ale_fix_on_save = 1

-- Python

vim.g.ale_python_black_options = '--line-length 88'
