-- Moving around, tabs, windows and buffers

-- Create Splits
vim.api.nvim_set_keymap('n', 'th', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tv', ':vsplit<CR>', { noremap = true })
-- Create a tab
vim.api.nvim_set_keymap('n', 'tn', ':tabe<CR>', { noremap = true })
-- Navigating between tabs
vim.api.nvim_set_keymap('n', '<leader>1', '<CMD>tabn 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '<CMD>tabn 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<CMD>tabn 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<CMD>tabn 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '<CMD>tabn 5<CR>', { noremap = true, silent = true })

-- navigate between Buffers
vim.api.nvim_set_keymap('n', '<leader>n', ':bn<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':bd<CR>', { noremap = true, silent = true})

-- delete a buffer without losing the split window
vim.api.nvim_set_keymap('n', '<C-x>', ':bp\\|bd #<CR>', { noremap = true })

-- Move lines up and down
vim.api.nvim_set_keymap('n', '<M-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-Down>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<M-Up>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Move between wrapped text
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':noh<CR>', { noremap = true, silent = true })

-- Terminal
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { noremap = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Restore default 'ge' in normal mode for markdown files
    vim.api.nvim_buf_set_keymap(0, "n", "ge", "ge", { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_user_command("OpenHTML", function()
  vim.cmd('!explorer.exe $(wslpath -w %)')
end, {})

