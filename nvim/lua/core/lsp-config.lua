-- Mason
local servers = { "lua_ls", "basedpyright", "ruff", "texlab", "html" }
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_enable = false
}
)

local lspconfig = require "lspconfig"

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
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


local capabilities = require('blink.cmp').get_lsp_capabilities()

for _, server in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    if server == "basedpyright" then
        opts.settings = {
            basedpyright = {
                analysis = {
                    -- Only analyze open files to reduce CPU/memory usage
                    diagnosticMode = "openFilesOnly",

                    -- Allow the LSP to organize imports (e.g., sort/remove unused ones)
                    disableOrganizeImports = false,

                    -- Automatically search for import paths in the workspace
                    autoSearchPaths = true,

                    -- Use the actual source code of libraries (not just stubs) for better type inference
                    useLibraryCodeForTypes = true,

                    -- Level of type checking: "off", "basic", or "strict"
                    -- "basic" is a good middle ground for most projects
                    typeCheckingMode = "basic",
                }
            }
        }
    elseif server == "texlab" then
        opts.settings = {
            texlab = {
                build = {
                    onSave = false
                },
                forwardSearch = {
                    executable = "zathura",
                    args = { "--synctex-forward", "%l:1:%f", "%p" },
                    onSave = false
                },
            },
        }
    end

    lspconfig[server].setup(opts)
end
