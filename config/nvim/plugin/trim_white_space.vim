nnoremap <silent> <leader>t :call TrimWhiteSpace()<CR>
function TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns s/\s\+$//e
    call winrestview(l:save)
endfunction
