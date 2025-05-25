return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        require("core.dashboard")
    end,
}
