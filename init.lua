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

vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Define NoChoices with only noremap and nowait
local NoChoices = {
    noremap = true,
    nowait = true
}

-- non-other function keys Keybinds
vim.keymap.set("n", "r", "<C-r>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "redo last change"
}))

vim.keymap.set("n", "t", ":terminal<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "opens terminal"
}))

-- Ctrl Keybinds
vim.keymap.set("n", "<C-s>", ":w<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "saves the file"
}))

vim.keymap.set("n", "<C-q>", ":qa<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "exits neovim"
}))

vim.keymap.set("n", "<C-a>", ":wa<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "saves every file in directory"
}))

-- Shift Keybinds
vim.keymap.set("n", "S", ":w<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "alternative saves file"
}))

vim.keymap.set("n", "T", ":Termdebug<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "opens Termdebug"
}))

-- Alt Keybinds
vim.keymap.set("n", "<M-n>", ":tabnew<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "opens a new tab"
}))

vim.keymap.set("n", "<M-d>", ":tabclose<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "closes the current tab"
}))

vim.keymap.set("n", "<A-PageRight>", ":tabnext<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "goes to the next tab"
}))

vim.keymap.set("n", "<A-PageLeft>", ":tabprevious<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "goes to the previous tab"
}))

-- Tab Keybinds
vim.keymap.set("n", "<Tab>", ":NvimTreeFocus<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "focuses the NvimTree"
}))

-- Special keybinds
vim.keymap.set("n", "<End>", ":qa<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "force ends the session"
}))

vim.keymap.set("n", "<Home>", ":q<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "closes current session spot"
}))

-- F Keys
vim.keymap.set("n", "<F2>", ":Run<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "runs the debugged code"
}))

-- Arrow Keys
vim.keymap.set("n", "<leader>k", "<C-w>k", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window up"
}))

vim.keymap.set("n", "<leader>h", "<C-w>h", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window to the left"
}))

vim.keymap.set("n", "<leader>j", "<C-w>j", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window down"
}))

vim.keymap.set("n", "<leader>l", "<C-w>l", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window to the right"
}))

require('config.lazy')
require('config.lsp')
require('base')
