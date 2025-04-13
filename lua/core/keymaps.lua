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

-- move around in insert mode
vim.keymap.set("i", "<C-]>", "<C-o>$", { noremap = true, silent = false, desc = "$ in insert mode" })
-- \/ this one for some reason doesn't let me leave insert mode... investigate later
-- vim.keymap.set("i", "<C-[>", "<C-o>0", { noremap = true, silent = false, desc = "0 in insert mode" })

-- clear search highlights
vim.keymap.set("n", "qs", "<cmd>nohl<CR>", { noremap = true, unique = true, desc = "clear search highlights" })


-- disable recording
vim.keymap.set("n", "q", "<Nop>")

-- open diagnostic in float
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })

vim.keymap.set("n", "<Space>d", vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })

-- exit terminal with esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, unique = true, desc = "exit terminal mode" })

-- wrap text
vim.keymap.set("n", "<leader>ww", "<cmd>set wrap<CR>", { noremap = true, unique = true, desc = "turn on text wrap" })
vim.keymap.set("n", "<leader>wn", "<cmd>set nowrap<CR>", { noremap = true, unique = true, desc = "turn off text wrap" })


-- macos clipboard
vim.keymap.set({ "n", "v", "i" }, "<D-v>", '"+p', { noremap = true, unique = true, desc = "paste from sys clipboard" })
vim.keymap.set("i", "<C-v>", '"+p', { noremap = true, unique = true, desc = "paste from sys clipboard" })
vim.keymap.set({ "n", "v", "i" }, "<D-c>", '"+y', { noremap = true, unique = true, desc = "copy to sys clipboard" })



-- use natural wheel scrolling
------------------------------

vim.o.scrolloff = 4 -- keep 4 lines from end of screen

vim.keymap.set("", "<ScrollWheelUp>", "<Up>", { noremap = true, silent = true, unique = true })
vim.keymap.set("", "<ScrollWheelDown>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("", "<ScrollWheelLeft>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("", "<ScrollWheelRight>", "<Right>", { noremap = true, silent = true })

-- move half a window down
vim.keymap.set("n", "<C-s>", "<C-d>", { noremap = true, silent = false, unique = true })
vim.keymap.set("n", "<C-j>", "<C-d>", { noremap = true, silent = false, unique = true })
vim.keymap.set("n", "<C-k>", "<C-u>", { noremap = true, silent = false, unique = true })

-- window managment
-----------------------------------------------------------------------------------

-- moving between vsplit
vim.keymap.set("n", "<leader>]", "<C-w>l", { noremap = true, unique = true, desc = "switch to right window" })
vim.keymap.set("n", "<leader>[", "<C-w>h", { noremap = true, unique = true, desc = "switch to left window" })

-- moving between split

vim.keymap.set("n", "<leader>=", "<C-w>k", { noremap = true, unique = true, desc = "switch to up window" })
vim.keymap.set("n", "<leader>\\", "<C-w>j", { noremap = true, unique = true, desc = "switch to down window" })

-- open terminal in current window
vim.keymap.set("n", "tt", "<cmd>terminal<CR>", { noremap = true, unique = true, desc = "make current window a terminal" })

-- split into top n bottom
vim.keymap.set("n", "<leader>ss", "<cmd>split<CR>",
    { noremap = true, unique = true, desc = "split current window into top & bottom" })
vim.keymap.set("n", "<leader>sd", "<cmd>split<CR>",
    { noremap = true, unique = true, desc = "split current window into top & bottom" })

-- split vertically
vim.keymap.set("n", "<leader>vs", "<cmd>vs<CR>",
    { noremap = true, unique = true, desc = "split current window into left & right" })
vim.keymap.set("n", "<leader>sv", "<cmd>vs<CR>",
    { noremap = true, unique = true, desc = "split current window into left & right" })

-- create terminal below
vim.keymap.set("n", "<leader>td", "<cmd>split<CR><cmd>terminal<CR>8<C-W>_a",
    { noremap = true, unique = true, desc = "open terminal below" })
vim.keymap.set("n", "<leader>T", "<cmd>split<CR><cmd>terminal<CR>8<C-W>_a",
    { noremap = true, unique = true, desc = "open terminal below" })

-- open neovim settings
vim.keymap.set("n", "<leader>nedit", function()
    local nconf_path = vim.fn.expand("~/.config/nvim/")
    vim.api.nvim_set_current_dir(nconf_path)
end, { noremap = true, unique = true, silent = false, desc = "open nvim config directory" })

-- reload current file
vim.keymap.set(
    "n",
    "<leader>rf",
    "<cmd>w<CR><cmd>e %<CR>",
    {
        silent = false,
        noremap = true,
        unique = true,
        desc = "reload current file",
    }
)

-- open current file with default application
vim.keymap.set(
    "n",
    "<leader>oc",
    "<cmd>!open %<CR>",
    {
        unique = true,
        noremap = true,
        desc = "open current file with default application"
    }
)


-- go to previous buffer
vim.keymap.set(
    "n",
    "<Space>b",
    "<C-6>",
    {
        desc = "go to previous buffer",
        silent = false,
        unique = true,
        noremap = true,
    }
)

-- misc
----------------------------------------------------

-- spellcheck
vim.keymap.set(
    "n",
    "<leader>sc",
    "<cmd>setlocal spell spelllang=en_gb<CR>",
    { noremap = true, unique = true, desc = "enable spellchecking" }
)

vim.keymap.set(
    "n",
    "<leader>==",
    "z=",
    { noremap = true, unique = true, desc = "same as z=" }
)

vim.keymap.set(
    "n",
    "<leader>-",
    "z=1",
    { unique = true, noremap = true, desc = "get 1st spelling suggestion" }
)

-- open lsp documentation
vim.keymap.set(
    "n",
    "<Tab>",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    { unique = true, noremap = true, desc = "view hover action" }
)
vim.keymap.set(
    "v",
    "<Tab>",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    { unique = true, noremap = true, desc = "view hover action" }
)


-- running files in-place
---------------------------------------------------

vim.api.nvim_create_user_command("RunFile", function()
    local file = vim.fn.expand("%:p") -- Get full path of the current file
    local ext = vim.fn.expand("%:e")  -- Get file extension

    local commands = {
        hs = "runghc",
        lua = "lua",
        py = "python3",
        rs = "cargo run",
        sh = "bash",
        js = "node",
    }

    local cmd = commands[ext]

    if cmd then
        vim.cmd("!" .. cmd .. " " .. file)
    else
        print("No run command configured for ." .. ext .. " files")
    end
end, {})

vim.keymap.set("n", "<leader>rr", ":RunFile<CR>", {
    unique = true,
    noremap = true,
    desc = "run current file interactively"
})

-- plugin specific stuff
------------------------------------------------------------------------------------

-- colourcodes.lua ------------------------------------------
-- disabling colouring of hex codes
vim.keymap.set("n", "<leader>e", "<cmd>ColorizerToggle<CR>",
    { noremap = true, unique = true, silent = false, desc = "toggle inline colour highlights" })

-- cmp.lua --------------------------------------------------
-- Function to enable completions
vim.keymap.set("n", "<leader>ce", function()
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.cmd('echo "Completions enabled"')
end, { noremap = true, silent = false, unique = true, desc = "enable completions" })

-- Function to disable completions
vim.keymap.set("n", "<leader>x", function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd('echo "Completions disabled"')
end, { noremap = true, silent = false, unique = true, desc = "disable completions" })


-- inlayhints.lua -------------------------------------------
vim.keymap.set("n", "<leader>ih", function()
    require("lsp-inlayhints").toggle()
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
        vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
    end,
    { silent = false, unique = true, noremap = true, desc = "Rust analyzer (?)", buffer = vim.api.nvim_get_current_buf() }
)

-- rust, not plugin. run fmt
vim.keymap.set(
    "n",
    "<leader>fmt",
    "<cmd>w<CR><cmd>!/Users/andtsa/Automator/run/target/release/run fmt<CR><cmd>e %<CR>",
    {
        silent = false,
        noremap = true,
        unique = true,
        desc = "run cargo fmt",
    }
)

-- nabla.nvim -----------------------------------------------

vim.keymap.set("n", "<leader>np", function()
    require("nabla").popup({
        border = "rounded" -- Customize border style: `single`, `double`, or `rounded`
    })
end, { noremap = true, unique = true, desc = "popup mathjax preview (for expr under cursor)" })

vim.keymap.set("n", "<leader>ni", function()
    require("nabla").toggle_virt({
        autogen = true, -- auto-regenerate ASCII art when exiting insert mode
        silent = false, -- silents error messages
        align_center = false,
    })
end, { noremap = true, unique = true, desc = "toggle inline mathjax preview" })


-- python shenanigans ---------------------------------------




-- typst.lua

vim.keymap.set(
    "n",
    "<leader>tp<CR>",
    "<cmd>TypstPreview<CR>",
    { noremap = true, unique = true, desc = "start typst preview" }
)
vim.keymap.set(
    "n",
    "<leader>tp<Esc>",
    "<cmd>TypstPreviewStop<CR>",
    { noremap = true, unique = true, desc = "stop typst preview" }
)


-- haskell.lua

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run,
    { unique = true, noremap = true, silent = false, desc = "open lsp code lens" })

-- TODO:
-- -- Hoogle search for the type signature of the definition under the cursor
-- vim.keymap.set("n", "<leader>hs", "<cmd>Telescope ht hoogle_signature<CR>",
--     { unique = true, noremap = true, silent = false, desc = "hoogle search" })

-- Evaluate all code snippets
vim.keymap.set("n", "<leader>he", "<cmd>Hls evalAll<CR>",
    { unique = true, noremap = true, silent = false, desc = "evaluate all code snippets" })

-- TODO:
-- -- Toggle a GHCi repl for the current package
-- vim.keymap.set("n", "<leader>hrp", "<cmd>Haskell repl toggle<CR>",
--     { unique = true, noremap = true, silent = false, desc = "toggle a ghci repl for current package" })

-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>hrb", "<cmd>Haskell repl toggle %<CR>",
    { unique = true, noremap = true, silent = false, desc = "toggle ghci repl for current buffer" })

vim.keymap.set("n", "<leader>hrq", "<cmd>Haskell repl quit<CR>",
    { unique = true, noremap = true, silent = false, desc = "quit the ghci repl" })


-- -- project explorer .lua ------------------
-- -----------------------------------------------------------
--
vim.keymap.set("n", "<leader>fv", "<C-f>",
    { unique = true, noremap = true, silent = false, desc = "view only fav projects" })
vim.keymap.set("n", "<leader>fa", "<C-A-f>",
    { unique = true, noremap = true, silent = false, desc = "add project to favs" })
vim.keymap.set("n", "<leader>fs", "<C-a>",
    { unique = true, noremap = true, silent = false, desc = "add new project" })
