vim.keymap.set("n", "<M-n>", ":tabnew<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "opens a new tab"
}))

vim.keymap.set("n", "<M-d>", ":tabclose<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "closes the current tab"
}))

-- Next Tab (h)
vim.keymap.set("n", "<M-l>", ":tabnext<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "goes to the next tab"
}))

-- Next Tab (right arrow)
vim.keymap.set("n", "<M><Right>", ":tabnext<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "uses arrow keys to go to the next tab"
}))

-- Previous Tab (l)
vim.keymap.set("n", "<M-h>", ":tabprevious<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "goes to the previous tab"
}))

-- Previous Tab (left arrow)
vim.keymap.set("n", "<M><Left>", ":tabprevious<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "goes to the previous tab"
}))

