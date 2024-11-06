return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "JoosepAlviste/nvim-ts-context-commentstring"
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        -- Disable deprecated context_commentstring module
        vim.g.skip_ts_context_commentstring_module = true

        -- Setup ts_context_commentstring
        require('ts_context_commentstring').setup({
            enable_autocmd = false -- Disable automatic comment context updates, optional
        })
        treesitter.setup({
            modules = {
                "rust",
                "html",
                "javascript",
                "lua",
                "markdown"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true, -- ..
            },
            sync_install = false,                         -- Install parsers synchronously (only applied to `ensure_installed`)
            auto_install = true,                          -- Automatically install missing parsers when entering buffer
            ignore_install = {},
            indent = { enable = true },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "c",
                "rust",
                "svelte",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "†", -- otherwise known as <ALT-t> :)
                    node_incremental = "†",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            -- rainbow = {
            --     enable = true,
            --     disable = {},
            --     extended_mode = true,
            --     max_file_lines = 10000,
            -- },
        })
    end,
}
