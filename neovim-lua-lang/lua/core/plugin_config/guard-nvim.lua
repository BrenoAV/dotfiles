local ft = require('guard.filetype')

ft('python'):fmt('ruff'):lint('ruff')

require('guard').setup({
    fmt_on_save = true,
    lsp_as_default_formatter = false,
})
