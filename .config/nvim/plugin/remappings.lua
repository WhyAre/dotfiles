function CopyToClipboard()
    local content = vim.fn.getreg('"')
    vim.fn.setreg('*', content)
    vim.fn.setreg('+', content)
end

vim.keymap.set("v", "y", "y<cmd>lua CopyToClipboard()<cr>", { desc = "Copy to Clipboard" })

vim.keymap.set("n", "<leader>cs", "<cmd>source %<CR>", { desc = "source %" })
vim.keymap.set("n", "<leader>ce", "<cmd>edit $MYVIMRC<CR>:cd %:p:h<CR>:pwd<CR>", { desc = "Edit configuration" })
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<CR>:pwd<CR>", { desc = "Change directory" })

-- Replicate unimpaired plugin by tpope
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "bnext" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "bprev" })
vim.keymap.set("n", "]c", "<cmd>cnext<CR>", { desc = "cnext" })
vim.keymap.set("n", "[c", "<cmd>cprev<CR>", { desc = "cprev" })
vim.keymap.set("n", "<c-j>", "<cmd>cnext<CR>", { desc = "cnext" })
vim.keymap.set("n", "<c-k>", "<cmd>cprev<CR>", { desc = "cprev" })
vim.keymap.set("n", "<c-q>", "<cmd>cclose<CR>", { desc = "cclose" })

-- Buffer management
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>b<c-d>", "<cmd>%bd! <Bar> e# <CR>", { desc = "Delete all but current buffer" })
