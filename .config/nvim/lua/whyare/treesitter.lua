if not vim.fn.has('nvim-0.6') then
    return
end

vim.g._ts_force_sync_parsing = true  -- https://github.com/neovim/neovim/issues/32660

require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",

        -- QoL
        "markdown",
        "markdown_inline",
        "c",
        "cpp",
        "python",
        "rust"
    },

    highlight = {
        enable = true,
    },
    indent = {
        enable = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
}
