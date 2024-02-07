function TrimWhiteSpace()
    local save = vim.fn.winsaveview()
    vim.cmd([[keeppatterns s/\s\+$//e]])
    vim.fn.winrestview(save)
end

vim.keymap.set('n', '<leader>t', TrimWhiteSpace, { desc = "Trim white space" })
