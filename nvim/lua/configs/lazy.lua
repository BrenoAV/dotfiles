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
    spec = {
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
        { 'saghen/blink.cmp', dependencies = { 'rafamadriz/friendly-snippets' } },
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
        { "lervag/vimtex",    lazy = false },
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
        -- Markdown
        -------------------------------------------------------------------------
        { "preservim/vim-markdown", dependencies = { "godlygeek/tabular" } },
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
        -- Vim-Iron
        -------------------------------------------------------------------------
        { "Vigemus/iron.nvim" },
        -------------------------------------------------------------------------
        -- NeoFormat
        -------------------------------------------------------------------------
        { "sbdchd/neoformat" },
        -------------------------------------------------------------------------
        -- Vim-Prettier
        -------------------------------------------------------------------------
        'prettier/vim-prettier',
        branch = 'release/0.x', -- Assuming you still want this branch
        build = 'yarn install --frozen-lockfile --production',
        ft = {
            'javascript',
            'typescript',
            'css',
            'less',
            'scss',
            'json',
            'graphql',
            'markdown',
            'vue',
            'svelte',
            'yaml',
            'html',
        }
    },
    install = { colorscheme = { "vscode" } },
})
