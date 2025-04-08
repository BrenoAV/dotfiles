local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
    s("hello", fmt([[print("hello, {}!")]], {i(1)}))
})
