-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'ThePrimeagen/harpoon',
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        event = 'VeryLazy',
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

            for i = 1, 5 do
                vim.keymap.set("n", string.format("<leader>%s", i), function() ui.nav_file(i) end,
                    { desc = string.format("Nav to file %s", i) })
            end
        end
    },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    },

    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()

            local npairs = require("nvim-autopairs")
            npairs.setup {
                disable_in_macro = true,
                break_undo = false
            }
            local Rule = require("nvim-autopairs.rule")
            local cond = require('nvim-autopairs.conds')

            local rules = {
                Rule("```", "```"),
                Rule("$", "$", {"typst"}),
                Rule("```.*$", "```"):only_cr():use_regex(true),
                Rule('"""', '"""'):with_pair(cond.not_before_char('"', 3)),
                Rule("'''", "'''"):with_pair(cond.not_before_char('"', 3)),
            }

            npairs.add_rules(rules)
        end
    },

    { 'godlygeek/tabular', event = 'VeryLazy' },

    { 'towolf/vim-helm',   ft = 'helm' },

    -- Colour
    'projekt0n/github-nvim-theme',
    'folke/tokyonight.nvim',
    { "catppuccin/nvim", name = "catppuccin" },
    'bluz71/vim-nightfly-colors',
    'Shatur/neovim-ayu',
    'Mofiqul/vscode.nvim',
    'EdenEast/nightfox.nvim',
    {
        'navarasu/onedark.nvim',
        config = function()
            require 'onedark'.setup({
                -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
                style = 'dark',
            })
        end

    },


    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        -- event = "VeryLazy",
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },

    -- Telescope

    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'nvim-telescope/telescope-file-browser.nvim',
        },

        event = 'VeryLazy',

        config = function()
            require 'whyare.telescope'
        end,
    },

    -- LSP
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require 'whyare.null_ls'
        end,
    },

    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'whyare.lsp'
        end
    },

    {
        'stevearc/conform.nvim',
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "isort", "black" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 1000,
                    lsp_format = "fallback"
                },
            })
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            -- 'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require('whyare.treesitter')
        end,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",


            'L3MON4D3/LuaSnip',
        },
        config = function()
            require('whyare.nvim_cmp')
        end
    },

    -- Snippets LuaSnip (with nvim-cmp support)
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require 'whyare.luasnip'
        end
    },

    -- Others
    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        config = function()
            require('Comment').setup()
        end
    },

    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
    },

    -- 'rhysd/committia.vim',

    {
        'stevearc/oil.nvim',
        event = 'VeryLazy',
        config = function()
            require("oil").setup()
            vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open oil.nvim" })
        end
    },

    -- Git
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require('gitsigns').setup {
                current_line_blame = true,
            }
        end
    },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
        config = function()
            require("diffview").setup({
                use_icons = false,
            })
        end
    },

    {
        'j-hui/fidget.nvim',
        -- https://github.com/j-hui/fidget.nvim#installation
        event = 'VeryLazy',
        config = function()
            require("fidget").setup()
        end
    },
    {
        'stevearc/aerial.nvim',
        event = 'VeryLazy',
        config = function()
            require("aerial").setup()
        end
    },

    {
        'earthly/earthly.vim',
        ft = "earthfile",
    },

    {
        'lervag/vimtex',
        ft = "tex"
    },

    {
        'kaarmu/typst.vim',
        ft = 'typst',
    },

    {
        "whyare/img-clip.nvim",
        event = "BufEnter",
        opts = {
            filetypes = {
                typst = {
                    template = [[
#figure(
  rect(image("$FILE_PATH", width: 80%)),
  caption: [$LABEL],
) <fig-$LABEL>
    ]],
                },
            },
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
        },
    },

    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },

    -- {
    --     'echasnovski/mini.files',
    --     version = false,
    --     event = 'VeryLazy',
    --     config = function()
    --         require('mini.files').setup()
    --         vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Open MiniFiles" })
    --     end
    -- },

    {
        'mfussenegger/nvim-dap',
        config = function()
            require("dapui").setup()

            vim.keymap.set("n", "<F1>", require'dap'.toggle_breakpoint)
            vim.keymap.set("n", "<F2>", require'dap'.continue)
            vim.keymap.set("n", "<F3>", require'dap'.step_over)
            vim.keymap.set("n", "<F4>", require'dap'.step_into)

            local dap = require('dap')
            dap.adapters.lldb = {
                type = 'executable',
                command = 'lldb-dap', -- adjust as needed, must be absolute path
                name = 'lldb'
            }

            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {},

                    -- 💀
                    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
                    --
                    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
                    --
                    -- Otherwise you might get the following error:
                    --
                    --    Error on launch: Failed to attach to the target process
                    --
                    -- But you should be aware of the implications:
                    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
                    -- runInTerminal = false,
                },
            }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
}

require("lazy").setup(plugins)
