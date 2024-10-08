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
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        -- snippets
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        { "rafamadriz/friendly-snippets" },
        -- Treesitter
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        -- Telescope
        {
            "nvim-telescope/telescope.nvim",
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
            lazy = false,
            init = function()
                vim.cmd('filetype plugin indent on')
                vim.cmd('syntax enable')
                vim.g.vimtex_quickfix_open_on_warning = false
                vim.g.vimtex_view_method = "zathura"
            end,
        },
        { "kkoomen/vim-doge" },
        -- Colorscheme
        { "Mofiqul/vscode.nvim",    name = "vscode", priority = 1000 },
    },
})
