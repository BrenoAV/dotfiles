-- Use <C-l> for trigger snippet expand.
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(coc-snippets-expand)', { silent = true })

-- Use <C-j> for select text for visual placeholder of snippet.
vim.api.nvim_set_keymap('v', '<C-j>', '<Plug>(coc-snippets-select)', { silent = true })

-- Use <C-j> for jump to next placeholder, it's default of coc.nvim
vim.g.coc_snippet_next = '<c-j>'

-- Use <C-k> for jump to previous placeholder, it's default of coc.nvim
vim.g.coc_snippet_prev = '<c-k>'

-- Use <C-j> for both expand and jump (make expand higher priority.)
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(coc-snippets-expand-jump)', { silent = true })

-- Use <leader>x for convert visual selected code to snippet
vim.api.nvim_set_keymap('x', '<leader>x', '<Plug>(coc-convert-snippet)', { silent = true })
