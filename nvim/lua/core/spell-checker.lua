-- Create (or clear) our augroup
local aug = vim.api.nvim_create_augroup("ToggleSpell", { clear = true })

-- Apply only to markdown and TeX-like filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern = { "markdown", "tex", "plaintex" },
  callback = function()
    -- 1) Toggle spell on/off
    vim.keymap.set("n", "<leader>ts", function()
      vim.wo.spell = not vim.wo.spell
      print("Spell check: " .. (vim.wo.spell and "On" or "Off"))
    end, { buffer = true, desc = "Toggle spell check" })

    -- 2) Swap spell-check language between pt_br and en_us
    vim.keymap.set("n", "<leader>tl", function()
      -- get current (first) language
      local langs = vim.opt_local.spelllang:get()
      local curr = langs[1] or ""
      -- decide new language (assumes you meant "en_us" for English US)
      local next = (curr == "pt_br") and "en_us" or "pt_br"
      vim.opt_local.spelllang = next
      print("Spell-check language: " .. next)
    end, { buffer = true, desc = "Toggle spell language pt-br↔en-us" })
  end,
})
