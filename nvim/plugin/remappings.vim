" {{ Plugins }}
" {{ Vim-Plug }}
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" MarkdownPreview
nnoremap <leader>pm :MarkdownPreview<CR>

" Own remappings
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>sc :source $MYVIMRC<CR>
nnoremap <leader>ec :edit $MYVIMRC<CR>:cd %:p:h<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>rc yy:<c-r>"<cr>
vnoremap <leader>rc y:<c-r>"<cr>
nnoremap <leader>rn :set relativenumber!<CR>

" Fixes weird terminal issues
tnoremap <s-space> <space>
tnoremap <s-CR> <CR>
tnoremap <s-BS> <BS>
tnoremap <c-space> <space>
tnoremap <c-CR> <CR>
tnoremap <c-BS> <BS>

" Makes my life more difficult
noremap  <Up> :res +5<CR>
noremap  <Down> :res -5<CR>
noremap  <Right> :vert res +5<CR>
noremap  <Left> :vert res -5<CR>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Toggle paste toggle
set pastetoggle=<F3>

noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
