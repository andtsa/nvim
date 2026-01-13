return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 1000
    end,
    opts = {
        -- whoosh
        layout = {
            width = { min = 13 }, -- min and max width of the columns
            spacing = 3,          -- spacing between columns
        },
        keys = {
            scroll_down = "<C-]>", -- binding to scroll down inside the popup
            scroll_up = "<C-[>",   -- binding to scroll up inside the popup
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
