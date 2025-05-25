return {
   "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed       = { "html", "jsonls", "pyright", "rust_analyzer", "lua_ls" },
            automatic_installation = true,
            automatic_enable       = false,
        })
    end
}
