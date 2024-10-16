local group = vim.api.nvim_create_augroup("python_autocommands", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(ev)
        -- Run current Python file
        vim.keymap.set('n', '<localleader>R', ':JupyterRunFile<CR>', { silent = true, buffer = ev.buf })

        -- Import current file as Python module
        vim.keymap.set('n', '<localleader>I', ':PythonImportThisFile<CR>', { silent = true, buffer = ev.buf })

        -- Change directory to the current file's directory
        vim.keymap.set('n', '<localleader>d', ':JupyterCd %:p:h<CR>', { silent = true, buffer = ev.buf })

        -- Send a selection or range of lines to Jupyter
        vim.keymap.set('n', '<localleader>X', ':JupyterSendCell<CR>', { silent = true, buffer = ev.buf })
        vim.keymap.set('n', '<localleader>E', ':JupyterSendRange<CR>', { silent = true, buffer = ev.buf })
        vim.keymap.set('n', '<localleader>e', '<Plug>JupyterRunTextObj', { silent = true, buffer = ev.buf })
        vim.keymap.set('v', '<localleader>e', '<Plug>JupyterRunVisual', { silent = true, buffer = ev.buf })

        -- Python Debugging: Set a breakpoint
        vim.keymap.set('n', '<localleader>b', ':PythonSetBreak<CR>', { silent = true, buffer = ev.buf })
    end,
    group = group
})
