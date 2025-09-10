-- Open NvimTree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

-- Load Termdebug on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("packadd termdebug")
  end,
})

-- Define NoChoices with only noremap and nowait
NoChoices = {
    noremap = true,
    nowait = true
}

require('keymaps')
require('config.lazy')
require('config.lsp')
require('base')

