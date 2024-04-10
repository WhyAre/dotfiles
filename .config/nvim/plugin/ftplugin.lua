vim.api.nvim_create_autocmd("FileType", {
  pattern = {"typst", "tex", "markdown"},
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
  end,
})
