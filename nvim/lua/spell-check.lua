-- Set up spell checking languages
local spell_languages = { "en_us", "pt_br" }

-- Function to toggle between the languages
local function toggle_spell_lang()
    local current_lang = vim.opt.spelllang:get()[1]
    if current_lang == "en_us" then
        vim.opt.spelllang = "pt_br"
        print("Spell language set to: Portuguese (Brazil)")
    else
        vim.opt.spelllang = "en_us"
        print("Spell language set to: English (US)")
    end
end

-- Function to toggle spell checking on/off
local function toggle_spell()
    vim.opt.spell = not vim.opt.spell:get()
    if vim.opt.spell:get() then
        print("Spell check: ON")
    else
        print("Spell check: OFF")
    end
end

-- Set default spell language and enable spell check
vim.opt.spelllang = spell_languages
vim.opt.spell = false

-- Autocommand to enable spell checking for text-based files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.md", "*.txt", "*.tex", "*.rst" },
    callback = function()
        vim.opt.spell = true
        vim.opt.spelllang = spell_languages
    end,
})

-- Keybindings
vim.keymap.set('n', '<leader>sl', toggle_spell_lang, { noremap = true, silent = true }) -- Toggle language
vim.keymap.set('n', '<leader>sc', toggle_spell, { noremap = true, silent = true })     -- Toggle spell check
