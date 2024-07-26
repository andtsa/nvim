return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        local color = require("colorizer")
        color.setup({
            filetypes = { "*" },
            user_default_options = {
                names = false,
                mode = "background",
            },
            buftypes = {},
        })
    end,
}
