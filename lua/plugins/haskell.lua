return {
    'mrcjkb/haskell-tools.nvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
        -- ~/.config/nvim/lua/plugins/keymaps/haskell_shortcuts.lua
        -- haskell.lua

        local ht = require('haskell-tools')
        local bufnr = vim.api.nvim_get_current_buf()
        -- haskell-language-server relies heavily on codeLenses,
        -- so auto-refresh (see advanced configuration) is enabled by default
        vim.keymap.set("n", '<space>cl', vim.lsp.codelens.run,
            { unique = true, noremap = true, silent = false, buffer = bufnr, desc = "open lsp code lens" })
        -- Hoogle search for the type signature of the definition under the cursor
        vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature,
            { unique = true, noremap = true, silent = false, buffer = bufnr, desc = "hoogle search" })
        -- Evaluate all code snippets
        vim.keymap.set('n', '<leader>ra', ht.lsp.buf_eval_all,
            { unique = true, noremap = true, silent = false, buffer = bufnr, desc = "evaluate all code snippets" })
        -- Toggle a GHCi repl for the current package
        vim.keymap.set('n', '<leader>rp', ht.repl.toggle,
            {
                unique = true,
                noremap = true,
                silent = false,
                buffer = bufnr,
                desc =
                "toggle a ghci repl for current package"
            })
        -- Toggle a GHCi repl for the current buffer
        vim.keymap.set('n', '<leader>rb', function()
                ht.repl.toggle(vim.api.nvim_buf_get_name(0))
            end,
            { unique = true, noremap = true, silent = false, buffer = bufnr, desc = "toggle ghci repl for current buffer" })
        vim.keymap.set('n', '<leader>rq', ht.repl.quit,
            { unique = true, noremap = true, silent = false, buffer = bufnr, desc = "quit the ghci repl" })
    end
}
