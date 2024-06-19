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
        -- LSP
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        -- Formartter
        'sbdchd/neoformat',
        -- Autocomplete
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        -- snippets
        { "rafamadriz/friendly-snippets" },
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {},
            config = function(_, opts)
                require("lsp_signature").setup(opts)
            end,
        },
        -- Treesitter
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        -- Colors
        {
            "ribru17/bamboo.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                require("bamboo").setup({
                    -- optional configuration here
                })
                require("bamboo").load()
            end,
        },
        -- Telescope
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.6",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup({})
            end,
        },
        -- vim-surround
        { "tpope/vim-surround" },
        -- lualine
        { "nvim-lualine/lualine.nvim" },
        -- todo-comments
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        -- markdown
        {
            "preservim/vim-markdown",
            branch = "master",
            dependencies = { "godlygeek/tabular" },
        },
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            build = "cd app ; yarn install",
            init = function()
                vim.g.mkdp_filetypes = { "markdown" }
            end,
            ft = { "markdown" },
        },
        {
            "prettier/vim-prettier",
            build = "yarn install --frozen-lockfile --production",
            init = function()
                vim.g.mkdp_filetypes = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown',
                    'vue', 'svelte', 'yaml', 'html' }
            end,

        },
        -- jupyter vim
        { "jupyter-vim/jupyter-vim" },
        -- vimtext
        {
            "lervag/vimtex",
            init = function()
                -- Use init for configuration, don't use the more common "config".
            end,
        },
        -- gruvbox
        { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
    },
})
