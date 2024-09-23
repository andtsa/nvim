return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- disable netrw to use nvim-tree instead
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            view = {
                width = 24,
                relativenumber = true
            },
            renderer = {
                indent_markers = { enable = true }
            },

            actions = {
                open_file = {
                    window_picker = { enable = true }
                }
            },
            filters = {
                custom = {
                    ".DS_Store",
                    ".git"
                }
            },
            git = {
                ignore = false
            }
        })
    end
}
