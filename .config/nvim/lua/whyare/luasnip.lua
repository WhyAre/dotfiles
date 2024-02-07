local ls = require 'luasnip'

vim.keymap.set("i", "<c-j>", function()
    if ls.expand_or_locally_jumpable() then
        ls.expand_or_jump()
    end
end, { desc = "ls.expand_or_jump()" })

vim.keymap.set("s", "<c-j>", function()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end, { desc = "ls.jump(1)" })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { desc = "ls.jump(-1)" })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { desc = "ls.change_choice(1)" })
vim.keymap.set({ "i", "s" }, "<c-h>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, { desc = "ls.change_choice(-1)" })

-- Load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()
