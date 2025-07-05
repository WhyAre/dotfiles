local _border = "single"
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = _border }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = _border }
)

vim.diagnostic.config({
    float = {
        border = _border,
    },
    virtual_text = true,
    virtual_lines = {
        current_line = true,
    },
})

vim.keymap.set("n", "<leader>li", '<cmd>LspInfo<CR>', { desc = "LSP Info" })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('whyare-lsp-attach', { clear = true }),
    callback = function(args)
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = 'Code actions' })
        vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float, { desc = 'Diagnostics' })
        vim.keymap.set("n", "<leader>lf", function()
            require("conform").format({lsp_format="fallback"})
        end, { desc = 'Format' })
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = 'Rename' })
        vim.keymap.set("n", ']d', vim.diagnostic.goto_next, { desc = 'Next error' })
        vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, { desc = 'Previous error' })
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'Open definition' })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = 'Go to declaration' })

        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })  -- Enabled all the time whether the lsp supports or not (thx jdtls)
        -- end
    end
})

local configured_lsps = {
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                check = {
                    command = "clippy",
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = {
                    checkThirdParty = false,
                    -- Tells lua_ls where to find all the Lua files that you have loaded
                    -- for your neovim configuration.
                    library = {
                        '${3rd}/luv/library',
                        unpack(vim.api.nvim_get_runtime_file('', true)),
                    },
                    -- If lua_ls is really slow on your computer, you can try this instead:
                    -- library = { vim.env.VIMRUNTIME },
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
                diagnostics = {
                    globals = { 'vim' }
                }
            },
        },
    },
    tinymist= {
        settings = {
            formatterMode = "typstyle",
            semanticTokens = "disable",
            projectResolution = "lockDatabase"
        }
    }
}

local enabled_lsps  = {
    'ocamllsp',
    'gopls',
    -- 'pyright',
    -- 'pylsp',
    'ts_ls',
    -- 'texlab',
    'clangd',
    'rust_analyzer',
    -- 'lua_ls',
    'tinymist'
}

local default_config = {}

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    default_config.capabilities = cmp_nvim_lsp.default_capabilities()
end

-- Set the config for LSPs
for lspserver_name, config in pairs(configured_lsps) do
    local c = vim.tbl_deep_extend("force", default_config, config)
    vim.lsp.config(lspserver_name, c)
end

-- Enable the relevant LSPs
for _, name in ipairs(enabled_lsps) do
    vim.lsp.enable(name)
end
