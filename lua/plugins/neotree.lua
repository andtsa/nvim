return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window:
        -- See `# Preview Mode` for more information
    },
    config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        -- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        -- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        -- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        -- vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.INFO]  = " ",
                    [vim.diagnostic.severity.HINT]  = " ",
                },
            },
        })

        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                position = "left",
                width = 24,
                mappings = require("plugins.keymaps.neotree-keymaps")
            },
            sort_case_insensitive = true,
            popup_border_style = "rounded",
            file_size = {
                enabled = true,
                required_width = 30, -- min width of window required to show this column
            },
            type = {
                enabled = true,
                required_width = 42, -- min width of window required to show this column
            },
            last_modified = {
                enabled = true,
                required_width = 35, -- min width of window required to show this column
            },
            created = {
                enabled = true,
                required_width = 50, -- min width of window required to show this column
            },
            symlink_target = {
                enabled = true,
            },
            filesystem = {
                filtered_items = {
                    hide_by_name = {
                        "node_modules"
                    },
                    hide_by_pattern = { -- uses glob style patterns
                        --"*.meta",
                        --"*/src/*/tsconfig.json",
                    },
                    always_show = { -- remains visible even if other settings would normally hide it
                        ".gitignore",
                    },
                    always_show_by_pattern = { -- uses glob style patterns
                        --".env*",
                    },
                    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                        --".DS_Store",
                        --"thumbs.db"
                    },
                },
                follow_current_file = {
                    enabled = true,         -- This will find and focus the file in the active buffer every time
                    --               -- the current file is changed while the tree is open.
                    leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
            }
        })
    end,
}
