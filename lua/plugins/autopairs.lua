-- generate bracket pairs {| -> {\n\t | \n}

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- enable treesitter
            disable_filetype = { "TelescopePrompt", "vim" },
        })

        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
}

