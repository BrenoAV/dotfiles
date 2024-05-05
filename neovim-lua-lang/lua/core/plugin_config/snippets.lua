local ls = require("luasnip")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node


ls.add_snippets(nil, {
    all = {
        snip({
            trig = "pandoc-header",
            namr = "header",
            dscr = "Basic header of pandoc",
        }, {
            text({"---", ""}),
            text({"title:", ""}),
            text({"author:", ""}),
            text({"date:", ""}),
            text({"category:", ""}),
            text({"lang:", ""}),
            text({"---", "", ""})
        }),
    },
})

