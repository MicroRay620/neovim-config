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

-- Keybind Helps
-- <C> is Ctrl
-- <M> is Meta/Alt
-- <S> is Shift
-- <CR> is enter
-- <PageUp> is the Up arrow key
-- <PageRight> is the Right arrow key
-- <PageLeft> is the Left arrow key
-- <PageDown> is the Down arrow key

vim.g.maplocalleader = " "
vim.g.mapleader = "\x1B" -- Supposed to be Ctrl, doesn't work for some reason

-- non-other function keys Keybinds
-- These are keybinds that don't use Function/Window key, Alt `<M>`, or Ctrl `<C>` keys
vim.keymap.set("n", "r", "<C-r>", {
  -- This is to redo the last change, not to be confused with the terminal
  noremap = true,
  nowait = true,
  silent = true,
  desc = "redo last change"
})
vim.keymap.set("n", "t", ":terminal<CR>", {
  noremap = true,
  nowait = true,
  silent = true,
  desc = "opens terminal"
})

-- Ctrl Keybinds
-- Ctrl is done by using `<C>` in the keymap
vim.keymap.set("n", "<C-s>", ":w<CR>", {
    -- Having it be `:wa<CR>` caused issues with the keymap not auto-executing, changed to `:w<CR>` to resolve the issue
    -- Figure out how to make a keymap that saves all the files
    noremap = true,
    nowait = true,
    silent = false, -- having silent = true broke the keymap function, previously this helped fix it
    -- Issue of the keymap not auto-executing has returned for some reason
    desc = "saves the file"
})
vim.keymap.set("n", "<C-q>", ":qa<CR>", {
    noremap = true,
    silent = false,
    desc = "exits neovim"
})
vim.keymap.set("n", "<C-a>", ":wa<CR>", {
    noremap = true,
    nowait = true,
    silent = false,
    desc = "saves every file in directory"
})

-- Shift Keybinds
vim.keymap.set("n", "S", ":w<CR>", {
    noremap = true,
    nowait = true,
    silent = false,
    desc = "alternative saves file"
})
vim.keymap.set("n", "T", ":Termdebug<CR>", {
    noremap = true,
    nowait = true,
    silent = false,
    desc = "alternative saves file"
})

-- Alt Keybinds
-- Alt is done by using `<M>` in the keymap
vim.keymap.set("n", "<A-n>", ":tabnew<CR>", {
    noremap = true,
    silent = true,
    desc = "opens a new tab"
})
vim.keymap.set("n", "<A-d>", ":tabclose<CR>", {
    noremap = true,
    silent = true,
    desc = "closes the current tab"
})
vim.keymap.set("n", "<A-PageRight>", ":tabnext<CR>", {
    -- This is Alt + Right Arrow
    noremap = true,
    silent = true,
    desc = "goes to the next tab"
})
vim.keymap.set("n", "<A-PageLeft>", ":tabprevious<CR>", {
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

-- Special keybinds
vim.keymap.set("n", "<End>", ":qa<CR>", {
    noremap = true,
    silent = false,
    desc = "force ends the session"
    -- Good for tiling window manager Terminals, like zellij
})
vim.keymap.set("n", "<Home>", ":q<CR>", {
    noremap = true,
    silent = false,
    desc = "closes current session spot"
})

-- F Keys
vim.keymap.set("n", "<F2>", ":Run<CR>", {
    noremap = true,
    nowait = true,
    silent = true,
    desc = "runs the debugged code"
})

require('config.lazy')
require('config.lsp')
require('base')
