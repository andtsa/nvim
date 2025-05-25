return {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
        require("lsp-inlayhints").setup({
            inlay_hints = {
                only_current_line = false,
                show_parameter_hints = true,
                show_variable_name_hints = true,
            },
        })
    end
}
