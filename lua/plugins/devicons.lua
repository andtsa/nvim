return {
    "nvim-tree/nvim-web-devicons",
    config = function ()
        local devicons = require('nvim-web-devicons')
        devicons.setup({
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
                }
            };
        })
    end
}
