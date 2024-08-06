vim.opt.background = 'dark'
local colorscheme = 'catppuccin-mocha'

function GenericHighlights()
    vim.api.nvim_set_hl(0, "ColorColumn", { fg = "#ffffff", bg = "#a61616" })


    if vim.o.background == 'light' then
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#000000" })
    else
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#abb3cc" })
    end

    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LineNr", { link = "CurLineNr" })
    vim.api.nvim_set_hl(0, "WhiteSpace", { link = "Comment" })
end

function TokyoNightHighlights()
    vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
end

local mycolour = vim.api.nvim_create_augroup('MyColours', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = mycolour,
    callback = function()
        GenericHighlights()
    end
})

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'tokyonight*',
    group = mycolour,
    callback = function()
        TokyoNightHighlights()
    end
})
if vim.g.vscode ~= nil then
    return
end

vim.cmd.colorscheme(colorscheme)
