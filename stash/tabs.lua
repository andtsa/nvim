return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            mode = "tabs",
            separator_style = "slant",
        },
    },
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                mode = "tabs",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Nvim Tree",
                        separator = true,
                        text_align = "left",
                    },
                },
                diagnostics = "nvim_lsp",
                separator_style = { "", "" },
                modified_icon = "●",
                show_close_icon = false,
                show_buffer_close_icons = true,
            },
        })
    end,
}
