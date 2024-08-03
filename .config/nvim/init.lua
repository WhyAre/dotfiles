vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.keymap.set('', '<Space>', '') -- Disables default behavior of <space>

require("plugins")

-- General settings
-- syntax on
-- filetype plugin indent on
vim.opt.backspace = "2"
vim.opt.lazyredraw = true
vim.opt.errorbells = false
vim.opt.wildmenu = true
vim.opt.path:append("**") -- From: https://youtu.be/XA2WjJbmmoM?t=409
vim.opt.mouse = 'a'
vim.opt.guicursor = ''
vim.opt.ruler = false

-- Timeout things
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 50

-- Tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
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
vim.opt.cursorline = true
vim.opt.textwidth = 0
vim.opt.colorcolumn = "81"
vim.opt.list = true
vim.opt.listchars = { tab = '>-', nbsp = '␣', trail = '•' }

-- Disable for security reasons.
-- https://github.com/numirias/security/blob/cf4f74e0c6c6e4bbd6b59823aa1b85fa913e26eb/doc/2019-06-04_ace-vim-neovim.md#readme
vim.opt.modeline = true
