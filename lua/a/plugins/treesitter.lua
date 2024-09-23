return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            modules = {
                "rust",
                "html",
                "javascript",
                "lua"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            sync_install = false,      -- Install parsers synchronously (only applied to `ensure_installed`)
            auto_install = true,       -- Automatically install missing parsers when entering buffer
            ignore_install = { "haskell" }, -- List of parsers to ignore installing

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
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            rainbow = {
                enable = true,
                disable = { "html" },
                extended_mode = false,
                max_file_lines = nil,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
        })
    end,
}
