local servers = {
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "cland", -- C/C++
    "omnisharp", -- C#
    "kotlin_language_server",
    "tsserver", -- JS/TS
    "gopls", -- Go
    "jdtls",
    "html",
    "css",
    "jsonls",
    "yamls",
}

local on_attach = function(_client, _bufnr)
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

        lspconfig.clangd.setup({
            on_attach = on_attach,
            capalities = capabilities,
            cmd = { "omnisharp", "--languageserver" },
        })
    end,
}
