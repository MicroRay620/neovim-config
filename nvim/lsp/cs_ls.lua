return {
    cmd = {
        "cs-language-server",
    },
    filetypes = {
        "cs",
    },
    root_markers = {
        ".git",
    },

    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}

