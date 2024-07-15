
-- Create an autocommand group for Python file mappings
local group = vim.api.nvim_create_augroup("python_autocommands", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(ev)
        -- Run current file
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>R', ':JupyterRunFile<CR>', { silent = true })

        -- Import current file
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>I', ':PythonImportThisFile<CR>', { silent = true })

        -- Change to directory of current file
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>d', ':JupyterCd %:p:h<CR>', { silent = true })

        -- Send a selection of lines
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>X', ':JupyterSendCell<CR>', { silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>E', ':JupyterSendRange<CR>', { silent = true })
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>e', '<Plug>JupyterRunTextObj', { silent = true })
        vim.api.nvim_buf_set_keymap(0, 'v', '<localleader>e', '<Plug>JupyterRunVisual', { silent = true })

        -- Debugging maps
        vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>b', ':PythonSetBreak<CR>', { silent = true })
    end,
    group = group
})
