-- keyboard mapping, desc = ""s

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
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = false, desc = "yank to system clipboard" })

-- paste in insert mode
vim.keymap.set("i", "<C-'>", "<C-r>\"", { noremap = true, silent = false, desc = "paste in insert mode" })

-- clear search highlights
vim.keymap.set("n", "<leader>q", "<cmd>nohl<CR>", { noremap = true, unique = true, desc = "clear search highlights" })


-- disable recording
vim.keymap.set("n", "q", "<Nop>")

-- open diagnostic in float
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })

-- exit terminal with esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, unique = true, desc = "exit terminal mode" })

-- wrap text
vim.keymap.set("n", "<leader>wy", "<cmd>set wrap<CR>", { noremap = true, unique = true, desc = "turn on text wrap" })
vim.keymap.set("n", "<leader>wn", "<cmd>set nowrap<CR>", { noremap = true, unique = true, desc = "turn off text wrap" })

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
vim.keymap.set("n", "<leader>]", "<C-w>l", { noremap = true, unique = true, desc = "switch to right window" })
vim.keymap.set("n", "<leader>[", "<C-w>h", { noremap = true, unique = true, desc = "switch to left window" })

-- moving between split

vim.keymap.set("n", "<leader>=", "<C-w>k", { noremap = true, unique = true, desc = "switch to up window" })
vim.keymap.set("n", "<leader>\\", "<C-w>j", { noremap = true, unique = true, desc = "switch to down window" })

vim.keymap.set("n", "tt", "<cmd>terminal<CR>", { noremap = true, unique = true, desc = "make current window a terminal" })

vim.keymap.set("n", "<leader>ss", "<cmd>split<CR>",
    { noremap = true, unique = true, desc = "split current window into top & bottom" })

-- create terminal below
vim.keymap.set("n", "<leader>T", "<cmd>split<CR><cmd>terminal<CR>8<C-W>_a",
    { noremap = true, unique = true, desc = "open terminal below" })

-- plugin specific stuff
------------------------------------------------------------------------------------

-- colourcodes.lua ------------------------------------------
-- disabling colouring of hex codes
vim.keymap.set("n", "<leader>e", "<cmd>ColorizerToggle<CR>",
    { noremap = true, unique = true, silent = false, desc = "toggle inline colour highlights" })

-- cmp.lua --------------------------------------------------
-- Function to enable completions
vim.keymap.set('n', '<leader>c', function()
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.cmd('echo "Completions enabled"')
end, { noremap = true, silent = false, unique = true, desc = "enable completions" })

-- Function to disable completions
vim.keymap.set('n', '<leader>x', function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd('echo "Completions disabled"')
end, { noremap = true, silent = false, unique = true, desc = "disable completions" })


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

-- nabla.nvim -----------------------------------------------

-- vim.cmd(
--     "nnoremap <leader>p :lua require(\"nabla\").popup()<CR> \" Customize with popup({border = ...})  : `single` (default), `double`, `rounded`"
-- )

-- vim.keymap.set("n", "<leader>p", function()
--     require("nabla").toggle_virt({
--         autogen = true, -- auto-regenerate ASCII art when exiting insert mode
--         silent = false, -- silents error messages
--         align_center = true,
--     })
-- end, { noremap = true, unique = true })
--
