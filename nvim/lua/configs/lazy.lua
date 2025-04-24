local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -------------------------------------------------------------------------
        -- Colorscheme
        -------------------------------------------------------------------------
        { "Mofiqul/vscode.nvim",             name = "vscode",    priority = 1000 },
        -------------------------------------------------------------------------
        -- Treesitter
        -------------------------------------------------------------------------
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        -------------------------------------------------------------------------
        -- LSP
        -------------------------------------------------------------------------
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        -------------------------------------------------------------------------
        -- Autocomplete
        -------------------------------------------------------------------------
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -------------------------------------------------------------------------
        -- Snippets
        -------------------------------------------------------------------------
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        -------------------------------------------------------------------------
        -- Telescope
        -------------------------------------------------------------------------
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        -------------------------------------------------------------------------
        -- nvim-tree
        -------------------------------------------------------------------------
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
        },
        -------------------------------------------------------------------------
        -- VimTex
        -------------------------------------------------------------------------
        { "lervag/vimtex", lazy = false },
        -------------------------------------------------------------------------
        -- Lualine
        -------------------------------------------------------------------------
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        -------------------------------------------------------------------------
        -- todo-comments
        -------------------------------------------------------------------------
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        -------------------------------------------------------------------------
        -- vim-surround
        -------------------------------------------------------------------------
        { "tpope/vim-surround" },
        -------------------------------------------------------------------------
        -- Markdown Preview
        -------------------------------------------------------------------------
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app ; yarn install",
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        },
        -------------------------------------------------------------------------
        -- Iron REPL
        -------------------------------------------------------------------------
        { 'Vigemus/iron.nvim' },

    },
})
