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
        -- 0) Fallback for lsp-inlayhints.nvim missing util API
        do
            local util = vim.lsp and vim.lsp.util
            if util and not util._str_utfindex_enc and util._str_byteindex_enc then
                util._str_utfindex_enc = util._str_byteindex_enc
            end
        end

        -- 1) Bootstrap mason
        require("mason").setup()

        -- 2) Configure mason-lspconfig (install required servers)
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed       = { "lua_ls", "html", "jsonls", "pyright", "r_language_server" },
            automatic_installation = true,
            automatic_enable       = false, -- disable deprecated vim.lsp.enable() calls
        })

        -- 3) Load lspconfig and capabilities
        local lspconfig    = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- 4) Special-case jdtls
        lspconfig.jdtls.setup({
            capabilities = capabilities,
        })

        -- 5) Lua language server + stylua formatting
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

        lspconfig.r_language_server.setup {}
        -- Save the original handler
        local default_diagnostics_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

        -- Override it safely
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            if client and client.name ~= "r_language_server" then
                return default_diagnostics_handler(_, result, ctx, config)
            end
            -- Do nothing for R diagnostics
        end


        lspconfig.pyright.setup {}

        lspconfig.texlab.setup {}

        -- 6) Global LspAttach hook for format-on-save & native inlay hints
        local attach_grp = vim.api.nvim_create_augroup("UserLspAttach", {})
        vim.api.nvim_create_autocmd("LspAttach", {
            group = attach_grp,
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local bufnr  = args.buf

                -- format on save (skip if disabled per-server)
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group    = attach_grp,
                        buffer   = bufnr,
                        callback = function()
                            local ext = vim.fn.fnamemodify(args.file, ":e")
                            if ext ~= "qmd" and ext ~= "rs" then
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end
                        end,
                    })
                end

                -- native inlay hints
                if client.server_capabilities.inlayHintProvider and type(vim.lsp.inlay_hint) == "function" then
                    vim.lsp.inlay_hint(bufnr, true)
                end
            end,
        })
    end,
}



-- return {
--     "neovim/nvim-lspconfig",
--     event = { "BufReadPre", "BufNewFile" },
--     dependencies = {
--         "hrsh7th/cmp-nvim-lsp",
--         { "folke/neodev.nvim", opts = {} },
--         "williamboman/mason.nvim",
-- "williamboman/mason-lspconfig.nvim",
--     },
--     config = function()
--         -- required before lspconfig
--         require('mason').setup()
--         local nvim_lsp = require("lspconfig")
--         local mason_lspconfig = require("mason-lspconfig")
--
--         -- local protocol = require("vim.lsp.protocol")
--
--         local on_attach = function(client, bufnr)
--             -- format on save
--             if client.server_capabilities.documentFormattingProvider then
--                 vim.api.nvim_create_autocmd("BufWritePre", {
--                     group = vim.api.nvim_create_augroup("Format", { clear = true }),
--                     buffer = bufnr,
--                     callback = function()
--                         vim.lsp.buf.format()
--                     end,
--                 })
--             end
--         end
--
--         local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--         nvim_lsp.jdtls.setup({})
--
--         mason_lspconfig.setup_handlers({
--             function(server)
--                 nvim_lsp[server].setup({
--                     capabilities = capabilities,
--                 })
--             end,
--             ["html"] = function()
--                 nvim_lsp["html"].setup({
--                     on_attach = on_attach,
--                     capabilities = capabilities,
--                 })
--             end,
--             ["jsonls"] = function()
--                 nvim_lsp["jsonls"].setup({
--                     on_attach = on_attach,
--                     capabilities = capabilities,
--                 })
--             end,
--             ["pyright"] = function()
--                 nvim_lsp["pyright"].setup({
--                     on_attach = on_attach,
--                     capabilities = capabilities,
--                 })
--             end,
--             ["rust_analyzer"] = function()
--             end
--         })
--     end,
-- }
