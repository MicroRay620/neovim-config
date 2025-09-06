local servers = {
    "clangd", -- C/C++ LSP (.c/.cpp)
    "cssls", -- CSS LSP (.css)
    "gopls", -- Go LSP (.go)
    "html", -- HTML LSP (.html)
    "jdtls", -- Java LSP (.jar/.java)
    "jsonls", -- JSON LSP (.json)
    "kotlin_language_server", -- Kotlin LSP (.kot)
    "omnisharp", -- C# LSP (.cs)
    "pyright", -- Python LSP (.py)
    "ruby_lsp", -- Ruby LSP (.rb/.erb)
    "rust_analyzer", -- Rust LSB (.rs)
    "ts_ls", -- Javascript/Typescript LSP (.js/.ts)
    "yamlls"
}

local on_attach = function(_client, _bufnr)
    local opts = { buffer = _bufnr, noremap = true, silent = true }

    -- Key maps
    vim.keymap.set("n", "K", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "F", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "E", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "M", vim.lsp.buf.implementation, opts) -- Fixed typo: implimentation -> implementation
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<C-r>", vim.lsp.buf.references, opts)
    -- For workspace folders, make the keybind have vim.lsp.buf.<add/remove>_workspace_folder
end

-- Initialize capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Try to enhance capabilities with cmp_nvim_lsp if available
local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return {
    "neovim/nvim-lspconfig",
    event = {"BufNewFile", "BufReadPost"},
    cmd = { "LspInfo", "LspLog", "LspRestart", "LspStart" },
    config = function()
        local lspconfig = require("lspconfig")
        -- Setup all servers with consistent configuration
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- CLangd 
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
        -- Kotlin 
        lspconfig.kotlin_language_server.setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
        -- Ruby
        lspconfig.ruby_lsp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "ruby-lsp" },
        })
        -- Omnisharp 
        lspconfig.omnisharp.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { "omnisharp", "--languageserver" },
        })
    end,
}
