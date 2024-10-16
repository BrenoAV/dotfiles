require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "ruff", "texlab", "ltex", "dockerls", "docker_compose_language_service" },
}
)

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- LSP configuration

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, bufopts)
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                ignore = "*",
                disableOrganizeImports = false,
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly'
            }
        },
    },
})
require("lspconfig").ruff.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
require("lspconfig").texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {
                onSave = false
            },
            forwardSearch = {
                executable = "zathura",
                -- executable = "C:\\Users\\breno\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
                onSave = false
            },
        },
    },
})
require("lspconfig").ltex.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 300 },
    settings = {
        ltex = {
            language = "en-US",
            checkFrequency = "save",
            additionalRules = {
                enablePickyRules = true
            },
            --              languageToolHttpServerUri = "https://api.languagetoolplus.com",
            --              languageToolOrg = {
            --              username = "",
            --              apiKey = ""
            --            }
        }
    }
})
require("lspconfig").dockerls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
require("lspconfig").docker_compose_language_service.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
