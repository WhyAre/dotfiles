call plug#begin()

" ## 'Essential' plugins ##
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'

" ## Application specific plugins ##
Plug 'iamcco/markdown-preview.nvim',
            \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" ## Style ##
Plug 'sainnhe/edge'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'

if has('nvim-0.5')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter'
endif

Plug 'preservim/nerdtree'

call plug#end()

let mapleader = " "

" General settings
syntax on
filetype plugin indent on
set backspace=2
set lazyredraw
set termguicolors
set noerrorbells
set wildmenu

" From: https://youtu.be/XA2WjJbmmoM?t=409
" Search
set path+=**

" Timeout things
set timeoutlen=1000
set ttimeoutlen=50

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Search
set incsearch
set nohlsearch
set ignorecase
set smartcase

" Show UI components
set showcmd
set showmode
set laststatus=2
set relativenumber
set number
set fileformat=unix
set fileformats=unix,dos

" Stop vim from creating files
set noswapfile
set hidden

" Readability
set nowrap
set scrolloff=5
set cursorline
set colorcolumn=80
set textwidth=79
set list
" set listchars=tab:>-,nbsp:␣,trail:•,eol:↲
set listchars=tab:>-,nbsp:␣,trail:•

" Disable for security reasons.
" https://github.com/numirias/security/blob/cf4f74e0c6c6e4bbd6b59823aa1b85fa913e26eb/doc/2019-06-04_ace-vim-neovim.md#readme
set nomodeline

set clipboard^=unnamed,unnamedplus

lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
require 'nvim-treesitter.install'.compilers = { "gcc" }
EOF

