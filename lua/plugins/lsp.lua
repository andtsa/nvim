return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed   = { "lua_ls", "html", "jsonls", "pyright", "r_language_server" },
            automatic_installation = true,
            automatic_enable   = false,
        })

        local lspconfig    = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.jdtls.setup({ capabilities = capabilities })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime     = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    workspace   = { library = vim.api.nvim_get_runtime_file("", true) },
                    telemetry   = { enable = false },
                },
            },
        })

        -- suppress noisy R diagnostics
        lspconfig.r_language_server.setup({
            capabilities = capabilities,
            handlers = {
                ["textDocument/publishDiagnostics"] = function() end,
            },
        })

        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.texlab.setup({ capabilities = capabilities })

        -- format on save + inlay hints on attach
        local attach_grp = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
        vim.api.nvim_create_autocmd("LspAttach", {
            group    = attach_grp,
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local bufnr  = args.buf

                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group  = attach_grp,
                        buffer = bufnr,
                        callback = function()
                            local ext = vim.fn.fnamemodify(args.file, ":e")
                            if ext ~= "qmd" and ext ~= "rs" then
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        end,
                    })
                end

                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end
            end,
        })
    end,
}
