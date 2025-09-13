return {
    -- This sets the color scheme 
    -- "Mofiqul/dracula.nvim",-- Change this to the github like (anything after github.com/) and paste it here 
    "tribela/transparent.nvim",
    config = function()
        vim.cmd("colorscheme transparent") -- Change this to the theme name as well if you're changing it
    end,
}
