-- ----------------------------------------------------------------------------
-- Slime Configuration
-- ----------------------------------------------------------------------------

-- Always use tmux as the target
vim.g.slime_target = 'tmux'

-- Fix paste issues in ipython
vim.g.slime_python_ipython = 1

-- Always send text to the top-right pane in the current tmux tab without asking
vim.g.slime_default_config = {
    socket_name = vim.split(os.getenv("TMUX") or "", ",")[1],
    target_pane = "{top-right}"
}

vim.g.slime_dont_ask_default = 1

-- ----------------------------------------------------------------------------
-- IPython-Cell Configuration
-- ----------------------------------------------------------------------------

-- Set leader key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- <Leader>s to start IPython
map('n', '<Leader>s', ':SlimeSend1 ipython --matplotlib<CR>', opts)

-- <Leader>r to run script
map('n', '<Leader>r', ':IPythonCellRun<CR>', opts)

-- <Leader>R to run script and time execution
map('n', '<Leader>R', ':IPythonCellRunTime<CR>', opts)

-- <Leader>c to execute the current cell
map('n', '<Leader>c', ':IPythonCellExecuteCell<CR>', opts)

-- <Leader>C to execute current cell and jump to the next
map('n', '<Leader>C', ':IPythonCellExecuteCellJump<CR>', opts)

-- <Leader>l to clear IPython screen
map('n', '<Leader>l', ':IPythonCellClear<CR>', opts)

-- <Leader>x to close all Matplotlib figure windows
map('n', '<Leader>x', ':IPythonCellClose<CR>', opts)

-- [c and ]c to jump to previous/next cell header
map('n', '[c', ':IPythonCellPrevCell<CR>', opts)
map('n', ']c', ':IPythonCellNextCell<CR>', opts)

-- <Leader>h to send current line or selection to IPython
map('n', '<Leader>h', '<Plug>SlimeLineSend', {})
map('x', '<Leader>h', '<Plug>SlimeRegionSend', {})

-- <Leader>p to run the previous command
map('n', '<Leader>p', ':IPythonCellPrevCommand<CR>', opts)

-- <Leader>Q to restart IPython
map('n', '<Leader>Q', ':IPythonCellRestart<CR>', opts)

-- <Leader>d to start debug mode
map('n', '<Leader>d', ':SlimeSend1 %debug<CR>', opts)

-- <Leader>q to exit debug mode or IPython
map('n', '<Leader>q', ':SlimeSend1 exit<CR>', opts)

-- <F9> and <F10> to insert a cell header tag above/below and enter insert mode
map('n', '<F9>', ':IPythonCellInsertAbove<CR>a', opts)
map('n', '<F10>', ':IPythonCellInsertBelow<CR>a', opts)

-- Also work in insert mode
map('i', '<F9>', '<C-o>:IPythonCellInsertAbove<CR>', opts)
map('i', '<F10>', '<C-o>:IPythonCellInsertBelow<CR>', opts)

