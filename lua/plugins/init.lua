-- nvim/lua/plugins/init.lua
-- load plugins that don't really require their own config

return {
    "nvim-lua/plenary.nvim", -- concurrent lua, for other plugins
    {
        "mfussenegger/nvim-dap",
        event = "BufReadPre"
    },
    -- "dstein64/vim-startuptime",
}
