vim.keymap.set("n", "<Tab>", ":NvimTreeFocus<CR>", vim.tbl_extend("keep", NoChoices, {
    silent = true,
    desc = "focuses the NvimTree"
}))

