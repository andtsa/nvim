return {
    "williamboman/mason.nvim",
    config = function()
        require('mason').setup()
    end
}
-- return {
--     "williamboman/mason.nvim",
--     dependencies = {
--         "williamboman/mason-lspconfig.nvim",
--         "WhoIsSethDaniel/mason-tool-installer.nvim",
--     },
--     config = function()
--         require("mason").setup()
--
--         require("mason-lspconfig").setup({
--             -- automatic_installation = true,
--             ensure_installed = {
--                 "pyright",
--                 "marksman",
--             },
--         })
--
--         require("mason-tool-installer").setup({
--             ensure_installed = {
--                 "prettier",
--                 "stylua", -- lua formatter
--                 "isort",  -- python formatter
--                 "black",  -- python formatter
--                 "pylint",
--                 "eslint_d",
--                 "marksman",
--             },
--         })
--     end,
-- }
