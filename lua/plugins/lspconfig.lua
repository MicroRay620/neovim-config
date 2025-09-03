local servers = {
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "clangd", -- C/C++
    "omnisharp", -- C#
    "kotlin_language_server",
    "ts_ls", -- JS/TS
    "gopls", -- Go
    "jdtls",
    "cssls",
    "html",
    "jsonls",
    "yamlls",
}

local on_attach = function(_client, _bufnr)
    local opts = { buffer = _bufnr, noremap = true, silent = true }

    -- Key maps
    vim.keymap.set("n", "E", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "G", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "M", vim.lsp.buf.implimentation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<C-r>", vim.lsp.buf.references, opts)
    -- For workplace folders, make the keybind have vim.lsp.buf.<add/remove>_workspace_folder
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if status then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

return {
    "neovim/nvim-lspconfig",
    event = {"BufNewFile", "BufReadPost"},
    cmd = { "LspInfo", "LspLog", "LspRestart", "LspStart" },
    config = function()
        local lspconfig = require("lspconfig")
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
            })
        end

        -- CLang
        lspconfig.clangd.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
            },
        })

        -- Omnisharp
        lspconfig.omnisharp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "omnisharp", "--languageserver" },
        })
    end,
}
