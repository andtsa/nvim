-- auto-commands

-- vim.api.nvim_create_autocmd({event}, {*opts})
--
-- {event}: (string or array) events that will trigger the handler
--      * BufEnter: after entering a buffer
--      * CmdlineLeave: before leaving the command-line
--      * See all available events with :h autocmd-events.
--
-- {opts}: options
--      * pattern (string or array): pattern to match
--      * callback (function or string): Lua function called when the event is triggered
--      * See all available options with :h nvim_create_autocmd.
--
-- example:
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.lua",
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPre", {
--     pattern = "*.*",
--     callback = function()
--         vim.opt.linebreak = true
--         vim.opt.wrap = true
--     end
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = "*.qmd",
--     callback = function()
--         vim.fn.jobstart({ "quarto", "format", vim.fn.expand("%") }, { detach = true })
--     end,
-- })

-- Enable inlay hints when the LSP attaches
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         require("lsp-inlayhints").on_attach(client, args.buf)
--     end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd("ColorizerAttachToBuffer")
    end
})

-- vim.api.nvim_create_autocmd('CursorHold', {
--     pattern = '*.rs',
--     callback = function()
--         vim.lsp.buf.hover()
--     end,
-- })
--

-- vim.cmd([[
--   augroup HaskellConceal
--     autocmd!
--     autocmd FileType hs setlocal conceallevel=2
--     autocmd FileType hs syntax match hsLambda "\\" conceal cchar=λ
--   augroup END
-- ]])
