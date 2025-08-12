vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
-- non-other function keys Keybinds
-- These are keybinds that don't use Function/Window key, Alt `<M>`, or Ctrl `<C>` keys
vim.keymap.set("n", "t", "<C-r>", {
  noremap = true,
  nowait = true;
  silent = true,
  desc = "redo last change"
})
-- Ctrl Keybinds
-- Ctrl is done by using `<C>` in the keymap
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
-- Alt Keybinds
-- Alt is done by using `<M>` in the keymap
vim.keymap.set("n", "<M-n>", ":tabnew<CR>", {
  noremap = true,
  silent = true,
  desc = "opens a new tab"
})
vim.keymap.set("n", "<M-d>", ":tabclose<CR>", {
  noremap = true,
  silent = true,
  desc = "closes the current tab"
})
vim.keymap.set("n", "<M-PageRight>", ":tabnext<CR>", {
  -- This is Alt + Right Arrow
  noremap = true,
  silent = true,
  desc = "goes to the next tab"
})
vim.keymap.set("n", "<M-PageLeft>", ":tabprevious<CR>", {
  -- This is Alt + Left Arrow
  noremap = true,
  silent = true,
  desc = "goes to the previous tab"
})
-- Tab Keybinds
vim.keymap.set("n", "<Tab>", ":NvimTreeFocus<CR>", {
  noremap = true,
  silent = true,
  desc = "focuses the NvimTree"
}) -- Enter <CR> is how you exit this portion
vim.keymap.set
require('config.lazy')
require('config.lsp')
require('base')
