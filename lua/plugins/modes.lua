return {
    'mvllow/modes.nvim',
    tag = 'v0.2.0',
    config = function()
        require('modes').setup({
            colors = {
                bg = "", -- Optional bg param, defaults to Normal hl group
                copy = "#fcc959",
                delete = "#c75c6a",
                insert = "#78cce5", -- "#32fa8a", -- "#78ccc5",
                visual = "#9745be",
            },

            -- Set opacity for cursorline and number background
            line_opacity = 0.12,

            -- Enable cursor highlights
            set_cursor = true,

            -- Enable cursorline initially, and disable cursorline for inactive windows
            -- or ignored filetypes
            set_cursorline = true,

            -- Enable line number highlights to match cursorline
            set_number = true,

            -- Disable modes highlights in specified filetypes
            -- Please PR commonly ignored filetypes
            ignore_filetypes = { 'NeoTree', 'TelescopePrompt' }
        })
    end
}
