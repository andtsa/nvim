return { -- temporarily removed
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore = false,
            suppress_dirs = { "/" }, -- { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })
    end,
}
