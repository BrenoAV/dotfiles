require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "lua", "vim", "c", "cpp", "markdown", "json", "dockerfile"},

    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
