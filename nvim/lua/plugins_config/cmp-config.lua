local cmp = require "cmp"

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
        -- { name = 'nvim_lsp_signature_help' },
    }, {
    })
})

-- Only enable cmp-cmdline for commands or search
require'cmp'.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
})

require'cmp'.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Bind <C-s> to trigger signature help in insert mode
vim.keymap.set('i', '<C-s>', function()
    vim.lsp.buf.signature_help()
end, { noremap = true, silent = true })
