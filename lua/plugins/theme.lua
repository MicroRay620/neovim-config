return {
    -- This sets the color scheme 
    "Mofiqul/dracula.nvim",-- Change this to the github like (anything after github.com/) and paste it here 
    "tribela/transparent.nvim", -- remove this is you don't want transparency 
    config = function()
        vim.cmd("colorscheme dracula") -- Change this to the theme name as well if you're changing it
    end,
}
