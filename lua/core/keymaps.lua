-- keyboard mappings 

vim.g.mapleader = "`"

-- Documentation
-----------------------------------------------------------------------------------
-- vim.keymap.set(
--     "n", -- the mode for the shortcut to exist in, 
--          --     "n":normal, 
--          --     "i":insert, 
--          --     "x":visual, 
--          --     "s":select, 
--          --     "v":either visual or select, 
--          --     "c":command line mode (ie when typing with `:`), 
--          --     "t":terminal mode, in the `:terminal`, 
--          --     "":empty string is all modes. 
--          -- You can specify multiple modes using a table {"n", "i"}.
--     shortcut: "", -- the shortcut u wanna map to something
--     target: "", -- the thing u wanna do when the shortcut happens
--     {
--         noremap = false, -- recursively evaluate shortcuts in `target`
--         silet = false, -- hide any feedback in the bottom bar
--         expr = false, -- evaluate the target as a vim expression
--         buffer = 0, -- the buffer to run the command in (default: not set = global)
--         nowait = false, -- execute the shortcut the moment its seen, even if more keystrokes would have triggered a different command
--         unique = false -- ensure the mapping doesn"t overwrite an existing one
--     }
-- )


-- Settings
-----------------------------------------------------------------------------------

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = false })


-- clear search highlights
vim.keymap.set("n", "<leader>q", ":nohl<CR>", { noremap = true, unique = true, desc = "clear search highlights" })


-- disable recording
vim.keymap.set("n", "q", "<Nop>")

-- open diagnostic in float
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)


-- use natural wheel scrolling
------------------------------

vim.o.scrolloff = 4 -- keep 4 lines from end of screen

vim.keymap.set("", "<ScrollWheelUp>", "<Up>", { noremap = true, silent = true, unique = true })
vim.keymap.set("", "<ScrollWheelDown>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("", "<ScrollWheelLeft>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("", "<ScrollWheelRight>", "<Right>", { noremap = true, silent = true })


-- window managment
-----------------------------------------------------------------------------------

-- moving between vsplit
vim.keymap.set("n", "<leader>]", "<C-w>l", { noremap = true, unique = true })
vim.keymap.set("n", "<leader>[", "<C-w>h", { noremap = true, unique = true })


-- plugin specific stuff
------------------------------------------------------------------------------------

-- colourcodes.lua ------------------------------------------
-- disabling colouring of hex codes
vim.keymap.set("n", "<leader>e", "<cmd>ColorizerToggle<CR>", { noremap = true, unique = true, silent = false })

-- cmp.lua --------------------------------------------------
-- Function to enable completions
vim.keymap.set('n', '<leader>c', function()
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.cmd('echo "Completions enabled"')
end, { noremap = true, silent = false, unique = true })

-- Function to disable completions
vim.keymap.set('n', '<leader>x', function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd('echo "Completions disabled"')
end, { noremap = true, silent = false, unique = true })


-- inlayhints.lua -------------------------------------------
vim.keymap.set('n', '<leader>h', function()
    require('lsp-inlayhints').toggle()
end, { noremap = true, silent = false, unique = true, desc = "Toggle Inlay Hints" })


-- todo.lua -------------------------------------------------
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


-- rust.lua -------------------------------------------------
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = false, unique = true, noremap = true, desc = "Rust analyzer (?)", buffer = vim.api.nvim_get_current_buf() }
)
