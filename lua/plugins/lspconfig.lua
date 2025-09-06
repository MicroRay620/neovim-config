local servers = {
    "clangd", -- C/C++ LSP
    "cssls", -- CSS LSP
    "gopls", -- Go LSP
    "html",
    "jdtls",
    "jsonls", -- JSON LSP (.json)
    "kotlin_language_server", -- Kotlin LSP (.kot)
    "omnisharp", -- C# LSP (.cs)
    "pyright", -- Python LSP (.py)
    "ruby_lsp", -- Ruby LSP (.rb)
    "rust_analyzer",
    "ts_ls", -- Javascript/Typescript LSP (.js/.ts)
    "yamlls"
}

local on_attach = function(_client, _bufnr)
    local opts = { buffer = _bufnr, noremap = true, silent = true }

    -- Key maps
    vim.keymap.set("n", "<F3>", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<F4>", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<F5>", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<F6>", vim.lsp.buf.implimentation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<C-r>", vim.lsp.buf.references, opts)
    -- For workplace folders, make the keybind have vim.lsp.buf.<add/remove>_workspace_folder
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

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

        if status then
            capabilities = cmp_nvim_lsp.default_capabilities()
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

        -- Kotlin
        lspconfig.kotlin_language_server.setup({
            on_attack = on_attach,
            capabilities = capabilities,
        })
    end,
}
