-- keyboard shortcuts
require("a.maps")

require("a.settings")

-- load plugins
require("a.lazy")

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = true, buffer = bufnr }
)



vim.cmd("colorscheme cyberdream")

-- Attach to buffer
require("colorizer").attach_to_buffer(0, { mode = "background", css = true })



vim.cmd("hi todo_macro ctermbg=128 guibg=#8000a7")
vim.cmd("autocmd BufWinEnter *.rs call matchadd('todo_macro', '^.*todo!().*$')")

-- Enable inlay hints when the LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        require("lsp-inlayhints").on_attach(client, args.buf)
    end,
})

vim.cmd [[
    autocmd BufWritePre *.lua lua vim.lsp.buf.format()
]]
