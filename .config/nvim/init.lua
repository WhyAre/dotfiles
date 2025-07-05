vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.keymap.set('', '<Space>', '') -- Disables default behavior of <space>

require("plugins")

-- General settings
vim.opt.backspace = "indent,eol,start,nostop"
vim.opt.lazyredraw = true
vim.opt.errorbells = false
vim.opt.wildmenu = true
vim.opt.path:append("**") -- From: https://youtu.be/XA2WjJbmmoM?t=409
vim.opt.mouse = 'a'
vim.opt.ruler = false

-- Tabs
vim.opt.tabstop = 8       -- The default is already 8, but I'll just explicitly set it here
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1  -- "When 'sts' is negative, the value of 'shiftwidth' is used."
vim.opt.smarttab = false  -- I want to actually understand how the tab works
vim.opt.shiftround = true
vim.opt.expandtab = false
vim.opt.autoindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = false

-- Show UI components
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.laststatus = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.fileformats = { "unix", "dos" }

-- Stop vim from creating files
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.undofile = true

-- Readability
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.textwidth = 0
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars = { tab = '>-', nbsp = '␣', trail = '•' }

-- Majority disable so I disable too
-- https://www.reddit.com/r/vim/comments/1bqkzu1/do_you_use_modelines/
vim.opt.modeline = false
