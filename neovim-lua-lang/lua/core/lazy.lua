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
        -- CoC
        {"neoclide/coc.nvim", branch = "release"},
        -- Ale
        {'dense-analysis/ale'},
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
    }
})
