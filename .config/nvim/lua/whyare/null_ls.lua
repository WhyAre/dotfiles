-- Null ls
local null_ls = require('null-ls')

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort
}

null_ls.setup({ sources = sources })
