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

-- keymaps
-- This only works if I have in the init.lua
-- !!!!! DO NOT MOVE THIS TO AN OTHER FILE !!!!!
vim.g.maplocalleader = " "
vim.g.mapleader = " " -- This sets the leader to spacebar


-- Navigation Keymaps
-- Letter Keys
-- Up
vim.keymap.set("n", "<leader>k", "<C-w>k", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window up"
}))
-- Left
vim.keymap.set("n", "<leader>h", "<C-w>h", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window to the left"
}))
-- Right
vim.keymap.set("n", "<leader>l", "<C-w>l", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves the window to the right"
}))
-- Down
vim.keymap.set("n", "<leader>j", "<C-w>j", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "moves to the window down"
}))

-- Arrow Key Moving
-- Up Arrow
vim.keymap.set("n", "<leader><Up>", "<C-w>k", vim.tbl_extend("keep", NoChoices, { 
    silent = false,
    desc = "arrow key. moves the window up"
}))
-- Left Arrow
vim.keymap.set("n", "<leader><Left>", "<C-w>h", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "arrow key. moves window to the left"
}))
-- Right Arrow
vim.keymap.set("n", "<leader><Right>", "<C-w>l", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "arrow key. moves window to the right"
}))
-- Down Arrow
vim.keymap.set("n", "<leader><Down>", "<C-w>j", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "arrow key. moves window down"
}))


require('keymaps')
require('config.lazy')
require('config.lsp')
require('base')

