-- Check if termguicolors is supported
if vim.fn.has('termguicolors') then
    -- Enable termguicolors
    vim.opt.termguicolors = true
end

-- Set background to dark
vim.opt.background = "dark"

-- Set gruvbox-material options
vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_better_performance = 1

-- Set colorscheme to gruvbox-material
vim.cmd('colorscheme gruvbox-material')

-- Set lightline colorscheme to gruvbox_material
vim.g.lightline = { colorscheme = 'gruvbox_material' }
