" Netrw
let g:netrw_dirhistmax = 0   " Prevents creation of .netrwhist
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_bufsettings = 'noma nomod nobl nowrap ro'

" NERDTree
" nnoremap <Leader>n :let @/=expand("%:t") <Bar> execute 'Vexplore' expand("%:h") <Bar> normal n<CR>
nnoremap <leader>n :NERDTreeFind<CR>

let NERDTreeShowHidden=1
