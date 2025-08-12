local servers = {
    "pyright",
    "rust_analyzer",
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
    end,
}
