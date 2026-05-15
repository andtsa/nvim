-- auto-commands

-- attach colorizer to every buffer on read
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd("ColorizerAttachToBuffer")
    end
})

-- sand LSP
vim.api.nvim_create_autocmd("FileType", {
    pattern  = "sand",
    callback = function()
        vim.lsp.start({
            name     = "sand",
            cmd      = { "/Users/andtsa/proj/sand/target/debug/lsp" },
            root_dir = vim.fn.getcwd(),
        })
    end
})
