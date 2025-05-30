vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typst", "tex", "markdown"},
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typst"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})
