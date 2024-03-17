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
        -- lsp
        {'williamboman/mason-lspconfig.nvim'},
        {'williamboman/mason.nvim'},
        {'neovim/nvim-lspconfig'},
        -- autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
        {'saadparwaiz1/cmp_luasnip'},
        {'rafamadriz/friendly-snippets'},
        {'hrsh7th/cmp-nvim-lsp-signature-help'},
        -- Formatter
        {
        "nvimdev/guard.nvim",
        -- Builtin configuration, optional
        dependencies = {
                "nvimdev/guard-collection",
            },
        },
        -- Treesitter
        { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
        -- Gruvbox
        {'sainnhe/gruvbox-material', lazy=false},
        -- Telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.6',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        -- nvim-tree
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                'nvim-tree/nvim-web-devicons',
            },
            config = function()
                require('nvim-tree').setup {}
            end
        },
        -- vim-surround
        {'tpope/vim-surround'},
		-- lualine
		{'nvim-lualine/lualine.nvim'},
        -- todo-comments
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" }
        },
        -- latex
        {
          "lervag/vimtex",
          init = function()
            -- Use init for configuration, don't use the more common "config".
          end
        },
        -- markdown
        {
            'preservim/vim-markdown' 
        }

    }
})


