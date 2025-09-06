vim.g.vimtex_quickfix_open_on_warning = false

vim.g.vimtex_view_method = "zathura_simple"

vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',                 -- or '-lualatex'
    '-interaction=nonstopmode',
    '-synctex=1',
    '-shell-escape',        -- <-- required for \includesvg
  },
}
