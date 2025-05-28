local telescope = require 'telescope'
telescope.setup {
    defaults = {
        prompt_prefix = "",
        layout_config = {
            preview_cutoff = 1,
            width = 0.95,
            height = 0.95,
        },
        file_ignore_patterns = {
            "%.git/.*",
            "node_modules/.*"
        },
    },
    pickers = {
        find_files = {
            disable_devicons = true,
            hidden = true,
        },
        live_grep = {
            additional_args = function(_)
                return { "--hidden" }
            end
        },
    },
    extensions = {
        fzf = {
            fuzzy = false,                  -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }

    }
}
telescope.load_extension 'fzf'

telescope.load_extension 'file_browser'


local telescope_builtin = require 'telescope.builtin'

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "Find file" })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Find buffer" })
vim.keymap.set('n', '<leader>fm', telescope_builtin.marks, { desc = "Find mark" })
vim.keymap.set('n', '<leader>fk', telescope_builtin.keymaps, { desc = "Find keymap" })
vim.keymap.set('n', '<leader>/', telescope_builtin.live_grep, { desc = "Grep" })

vim.keymap.set('n', '<leader>.', telescope.extensions.file_browser.file_browser,
    { desc = "Browse files" })
