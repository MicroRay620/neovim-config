vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
vim.keymap.set("n", "t", "<C-r>", {
  noremap = true,
  silent = true,
  desc = "redo last change"
})
vim.keymap.set("n", "<C-s>", ":w<CR>", {
  -- Having it be `:wa<CR>` caused issues with the keymap not auto-executing, changed to `:w<CR>` to resolve the issue
  -- Figure out how to make a keymap that saves all the files
  noremap = true,
  silent = false, -- having silent = true broke the keymap function, previously this helped fix it
  -- Issue of the keymap not auto-executing has returned for some reason
  nowait = true,
  desc = "saves the file"
})
vim.keymap.set("n", "<C-q>", ":qa")
require('config.lazy')
require('config.lsp')
require('base')
