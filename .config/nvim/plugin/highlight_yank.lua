-- Highlights on yank
local highlight_yank = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    command = 'silent! lua vim.highlight.on_yank({higroup="Search", timeout=200})',
    group = highlight_yank
})
