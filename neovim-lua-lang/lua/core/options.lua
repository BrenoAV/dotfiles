vim.opt.mouse = ''
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
vim.opt.number = true
vim.opt.tabstop = 4  -- show existing tab with 4 spaces width
vim.opt.softtabstop = 4 -- show existing tab with 4 spaces width
vim.opt.shiftwidth = 4 -- when identing with '>', use 4 spaces width
vim.opt.expandtab = true -- on pressing tab, insert 4 spaces
vim.opt.smarttab = true -- insert tabs on the start of a line according to shiftwidth
vim.opt.smartindent = true -- automatically inserts one extra level of indentation in some cases
vim.opt.hidden = true -- Hides the current buffer when a new file is openned
vim.opt.incsearch = true -- incremental search
vim.opt.ignorecase = true -- ignore case in search
vim.opt.smartcase = true -- consider case if there is a upper case character
vim.opt.scrolloff = 8 -- minimum number of lines to keep above and below the cursor
vim.opt.colorcolumn = '81' -- draws a line at the given line to keep aware of the line size
vim.opt.signcolumn = 'yes' -- add a column on the left. Useful for linting
vim.opt.cmdheight = 2 -- give more space for displaying messages
vim.opt.updatetime = 100 -- time in miliseconds to consider the changes
vim.opt.encoding = 'utf-8' -- the enconding should be utf-8 to activate the font icons
vim.opt.backup = false -- no backup files
vim.opt.writebackup = false -- no backup files
vim.opt.splitright = true -- create the vertical splits to the right
vim.opt.splitbelow = true -- create the horizontal splits below
vim.opt.autoread = true -- update vim after file update from outside
vim.opt.relativenumber = true
vim.opt.foldmethod = 'indent'
vim.opt.filetype = 'on'
vim.opt.termguicolors = true

local is_windows = package.config:sub(1, 1) == '\\'

if is_windows then
    vim.g.python3_host_prog = 'C:\\Program Files\\Python312\\python.exe'
else
    vim.g.python3_host_prog = '/usr/bin/python3'
end

-- Finding Files
-- Search down into subfolders
vim.opt.path:append("**")
-- Provides tab-completion for all file-related tasks
vim.opt.wildmenu = true
-- Display all matching files when we tab complete
-- Not necessary in most Lua-based editors as they often have different autocompletion mechanisms
-- Lua editors may have their own ways to handle autocomplete

-- Things to consider:
-- - :b lets you autocomplete any open buffer
-- Not applicable in most Lua-based editors

-- Moving around, tabs, windows and buffers

-- Create Splits
vim.api.nvim_set_keymap('n', 'th', ':split<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tv', ':vsplit<CR>', { noremap = true })

-- Create a tab
vim.api.nvim_set_keymap('n', 'tn', ':tabe<CR>', { noremap = true })

-- Navigating between tabs
vim.api.nvim_set_keymap('n', '<C-l>', ':tabn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':tabp<CR>', { noremap = true })

-- navigate between Buffers
vim.api.nvim_set_keymap('n', 'ty', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tr', ':bp<CR>', { noremap = true })

-- Close the current buffer
vim.api.nvim_set_keymap('n', 'td', ':bd<CR>', { noremap = true })

-- delete a buffer without losing the split window
vim.api.nvim_set_keymap('n', '<C-x>', ':bp\\|bd #<CR>', { noremap = true })

-- Close all buffers but this one
vim.api.nvim_set_keymap('n', '<leader>bd', ':%bd\\|e#\\|bd#<CR>\\|\'"', { noremap = true })

-- Move lines up and down
vim.api.nvim_set_keymap('n', '<M-Down>', ':m .+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':m .-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('v', '<M-Down>', ':m \'>+1<CR>gv=gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<M-Up>', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Exec scripts
vim.api.nvim_set_keymap('n', 'tp', ':!python %<CR>', { noremap = true })

-- Move between wrapped text
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })

-- AUTOCMD
function HighlightWordUnderCursor()
    if vim.fn.getline('.'):sub(vim.fn.col('.') - 1, vim.fn.col('.') - 1):match('[%w]') then
        vim.cmd('match Search /\\V\\<' .. vim.fn.expand('<cword>') .. '\\>/')
    else
        vim.cmd('match none')
    end
end

vim.cmd('autocmd CursorHold,CursorHoldI * lua HighlightWordUnderCursor()')

vim.cmd([[
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END
]])

