" Plugins

" Fixes weird terminal issues
tnoremap <s-space> <space>
tnoremap <s-CR> <CR>
tnoremap <s-BS> <BS>
tnoremap <c-space> <space>
tnoremap <c-CR> <CR>
tnoremap <c-BS> <BS>

" Makes arrow keys resize instead :>
nnoremap  <Up> <cmd>res +5<CR>
nnoremap  <Down> <cmd>res -5<CR>
nnoremap  <Right> <cmd>vert res +5<CR>
nnoremap  <Left> <cmd>vert res -5<CR>
imap <Up> <esc><Up>a
imap <Down> <esc><Down>a
imap <Left> <esc><Left>a
imap <Right> <esc><Right>a

noremap <F10> <cmd>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
