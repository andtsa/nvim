return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        local cyber = require("cyberdream")
        cyber.setup({
            -- Enable transparent background
            transparent = true,
            -- Enable italics comments
            italic_comments = true,
            -- Replace all fillchars with ' ' for the ultimate clean look
            hide_fillchars = false,
            -- Modern borderless telescope theme
            borderless_telescope = false,

            -- Set terminal colors used in `:terminal`
            terminal_colors = true,
        })
    end
}
