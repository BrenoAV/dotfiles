-- Mason
local servers = { "lua_ls", "basedpyright", "ruff", "texlab", "html", "ltex_plus" }
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_enable = false
}
)

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
                disableOrganizeImports = false,
                diagnosticMode = "openFilesOnly",
                analysis = {
                    typeCheckingMode = "recommended",
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
    elseif server == "ltex_plus" then
        opts.on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            require("ltex_extra").setup {
                -- table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
                -- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
                load_langs = { "en-US" }, -- en-US as default
                -- boolean : whether to load dictionaries on startup
                init_check = true,
                -- string : relative or absolute path to store dictionaries
                -- e.g. subfolder in the project root or the current working directory: ".ltex"
                -- e.g. shared files for all projects:  vim.fn.expand("~") .. "/.local/share/ltex"
                path = vim.fn.expand("~") .. "/.local/share/ltex", -- project root or current working directory
                -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
                log_level = "none",
                -- table : configurations of the ltex language server.
                -- Only if you are calling the server from ltex_extra
                server_opts = nil
            }
        end
        opts.settings = {
            ltex = {
                language = "en-US",
                checkFrequency = "save",
                additionalRules = {
                    enablePickyRules = true,
                },
                completionEnabled = true,
            }
        }
    end
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
end
