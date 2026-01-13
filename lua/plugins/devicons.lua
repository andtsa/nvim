return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        local devicons = require('nvim-web-devicons')
        devicons.setup({
            -- globally enable different highlight colors per icon (default to true)
            -- if set to false all icons will have the default icon's color
            color_icons = false,

            override = {
                zsh = {
                    icon = "",
                    color = "#428850",
                    cterm_color = "65",
                    name = "Zsh"
                },
                -- dir = {
                --     icon = "./",
                --     color = "#828890",
                --     cterm_color = "65",
                --     name = "Folder"
                -- }
            },

            override_by_extension = {
                ["log"] = {
                    icon = "",
                    color = "#f1e043",
                    name = "Log"
                },
                ["rs"] = {
                    icon = "", -- "",
                    -- icon = "",
                    color = "#cf8828",
                    name = "Rust"
                },
                ["toml"] = {
                    icon = "ﬧ", -- ""
                    color = "#43e0f1",
                    name = "TOML"
                },
                ["tex"] = {
                    icon = "", -- ``
                    color = "#ffa954",
                    name = "LaTeX"
                }
            },
        })
    end
}
