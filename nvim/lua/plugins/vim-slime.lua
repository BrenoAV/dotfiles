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

-- <localleader>s to start IPython
map('n', '<localleader>s', ':SlimeSend1 ipython --matplotlib<CR>', opts)

-- <localleader>r to run script
map('n', '<localleader>r', ':IPythonCellRun<CR>', opts)

-- <localleader>R to run script and time execution
map('n', '<localleader>R', ':IPythonCellRunTime<CR>', opts)

-- <localleader>c to execute the current cell
map('n', '<localleader>c', ':IPythonCellExecuteCell<CR>', opts)

-- <localleader>C to execute current cell and jump to the next
map('n', '<localleader>C', ':IPythonCellExecuteCellJump<CR>', opts)

-- <localleader>x to close all Matplotlib figure windows
map('n', '<localleader>x', ':IPythonCellClose<CR>', opts)

-- [c and ]c to jump to previous/next cell header
map('n', '[c', ':IPythonCellPrevCell<CR>', opts)
map('n', ']c', ':IPythonCellNextCell<CR>', opts)

-- <localleader>h to send current line or selection to IPython
map('n', '<localleader>h', '<Plug>SlimeLineSend', {})
map('x', '<localleader>h', '<Plug>SlimeRegionSend', {})

-- <localleader>Q to restart IPython
map('n', '<localleader>Q', ':IPythonCellRestart<CR>', opts)

-- <localleader>d to start debug mode
map('n', '<localleader>d', ':SlimeSend1 %debug<CR>', opts)

-- <localleader>q to exit debug mode or IPython
map('n', '<localleader>q', ':SlimeSend1 exit<CR>', opts)

-- <F9> and <F10> to insert a cell header tag above/below and enter
map('n', '<F9>', ':IPythonCellInsertAbove<CR>a', opts)
map('i', '<F9>', '<C-o>:IPythonCellInsertAbove<CR>', opts)
map('n', '<F10>', ':IPythonCellInsertBelow<CR>a', opts)
map('i', '<F10>', '<C-o>:IPythonCellInsertBelow<CR>', opts)

