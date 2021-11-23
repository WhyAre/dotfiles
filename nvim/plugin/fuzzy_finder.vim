" Key mapping
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>

" nnoremap <silent> <leader>ff :Files<cr>
" nnoremap <leader>fb :Buffers<cr>
" nnoremap <leader>fm :Marks<cr>

" Listing buffers
nnoremap <leader>b :buffers<cr>:b 
nnoremap <leader>m :marks<cr>
