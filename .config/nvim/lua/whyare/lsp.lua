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
})

vim.keymap.set("n", "<leader>li", '<cmd>LspInfo<CR>', { desc = "LSP Info" })

local on_attach = function(_)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = 'Code actions' })
    vim.keymap.set("n", "<leader>ld", require "telescope.builtin".diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set("n", "<leader>lo", vim.diagnostic.open_float, { desc = 'Diagnostics' })
    vim.keymap.set("n", "<leader>lf", function()
        require("conform").format({ lsp_fallback = true })
    end, { desc = 'Format' })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = 'Rename' })
    vim.keymap.set("n", '<c-]>', require "telescope.builtin".lsp_definitions,
        { desc = 'Go to definition' })
    vim.keymap.set("n", ']d', vim.diagnostic.goto_next, { desc = 'Next error' })
    vim.keymap.set("n", '[d', vim.diagnostic.goto_prev, { desc = 'Previous error' })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = 'Open definition' })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = 'Go to declaration' })
    vim.keymap.set("n", "gI", require "telescope.builtin".lsp_implementations,
        { desc = 'Go to implementation' })
    vim.keymap.set("n", "gT", require "telescope.builtin".lsp_type_definitions,
        { desc = 'Go to type definition' })
    vim.keymap.set("n", "gd", require "telescope.builtin".lsp_definitions, { desc = 'Go to definition' })
    vim.keymap.set("n", "gr", require "telescope.builtin".lsp_references, { desc = 'Go to references' })
end

local configs = {
    gopls = { enabled = true },
    pyright = { enabled = true },
    pylsp = { enabled = true },
    texlab = { enabled = true },
    clangd = { enabled = true },
    rust_analyzer = { enabled = true },
    kotlin_language_server = { enabled = true },
    lua_ls = {
        enabled = false,
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
    typst_lsp= {
        enabled = false,
        settings = {
            exportPdf = "never" -- Choose onType, onSave or never.
            -- serverPath = "" -- Normally, there is no need to uncomment it.
        }
    }
}

local default_config = {
    on_attach = on_attach,
}

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    default_config.capabilities = cmp_nvim_lsp.default_capabilities()
end

local lspconfig = require('lspconfig')
for lspserver, config in pairs(configs) do
    local enabled = config.enabled

    if enabled then
        config[enabled] = nil  -- Just so that it doesn't "pollute the config"
        local c = vim.tbl_deep_extend("force", default_config, config)
        lspconfig[lspserver].setup(c)
    end

end