" General settings
syntax on
filetype plugin indent on
set mouse=a
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
set tabstop=8
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

" Stop vim from creating files
set noswapfile
set hidden

" Readability
set nowrap
set scrolloff=5
set cursorline
set colorcolumn=80
set textwidth=72

" Disable for security reasons.
" https://github.com/numirias/security/blob/cf4f74e0c6c6e4bbd6b59823aa1b85fa913e26eb/doc/2019-06-04_ace-vim-neovim.md#readme
set nomodeline

" Remappings
let mapleader=" "
nnoremap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>:cd %:p:h<CR>

" Python
let g:python_recommended_styles=0

" Colour scheme
if has('unix')
    highlight Normal guibg=NONE ctermbg=NONE
endif
