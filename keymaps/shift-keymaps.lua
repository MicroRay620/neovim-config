-- Shift Keybinds
vim.keymap.set("n", "S", ":w<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "alternative saves file"
}))

vim.keymap.set("n", "T", ":Termdebug<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = false,
    desc = "opens Termdebug"
}))

