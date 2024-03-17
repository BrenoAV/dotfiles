require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "lua", "vim", "c", "dockerfile", "cpp", "rust"},

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
