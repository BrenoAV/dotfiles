require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ruff_lsp", "pyright", "ltex", "texlab", "powershell_es" }
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require("lspconfig").ruff_lsp.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
      typeCheckingMode = "strict"
    },
  },
}

require('lspconfig').ltex.setup{
    on_attach = on_attach,
    settings = {
        ltex = {
            enabled = {"latex", "tex", "bib", "md"},
            checkFrequency="save"
        }
    }
    -- settings ={
    --   ltex = {
    --     languageToolHttpServerUri='https://api.languagetoolplus.com',
    --     languageToolOrg = {
    --       username='@gmail.com',
    --       apiKey = '',
    --     }
    --   }
    -- }
}

require('lspconfig').powershell_es.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').texlab.setup{
    on_attach = on_attach,
    capabilities = capabilities
}
