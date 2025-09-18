return {
    -- Need to actually configure this but I don't know what the fuck I am doing
    -- If you know, please submit a pull request
    "norcalli/snippets.nvim",
    config = function ()
        require'snippets'.snippets = {
            _global = {
                date = os.date; -- This gets the date 
                epoch = function()
                    return os.time()
                end;
            };
        }
    end,
}
