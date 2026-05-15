-- keyboard mappings

vim.g.mapleader = "`"

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y',         { noremap = true, silent = false, desc = "yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<D-c>", '"+y',    { noremap = true, unique = true,  desc = "copy to sys clipboard" })
vim.keymap.set({ "n", "v" }, "<D-v>", '"+p',    { noremap = true, unique = true,  desc = "paste from sys clipboard" })
vim.keymap.set("i", "<D-v>", '<Esc>"+pA',       { noremap = true, unique = true,  desc = "paste from sys clipboard" })
vim.keymap.set("i", "<C-v>", '<Esc>"+pA',       { noremap = true, unique = true,  desc = "paste from sys clipboard" })

-- insert-mode movement
vim.keymap.set("i", "<C-'>", "<C-r>\"",         { noremap = true, silent = false, desc = "paste in insert mode" })
vim.keymap.set("i", "<C-]>", "<C-o>$",          { noremap = true, silent = false, desc = "jump to end of line in insert mode" })

-- greek keyboard compat
vim.keymap.set({ "n", "v" }, "α", "a")
vim.keymap.set({ "n", "v" }, "ι", "i")
vim.keymap.set({ "n", "v" }, "ρ", "r")
vim.keymap.set({ "n", "v" }, "δ", "d")
vim.keymap.set({ "n", "v" }, "ω", "v")
vim.keymap.set({ "n", "v" }, "Ω", "V")
vim.keymap.set({ "n", "v" }, "υ", "y")
vim.keymap.set({ "n", "v" }, "π", "p")
vim.keymap.set({ "n", "v" }, "θ", "u")
vim.keymap.set({ "n", "v" }, "<C-ρ>", "<C-r>")
vim.keymap.set("v", "<leader>υ", '"+y')

-- misc editing
vim.keymap.set("n", "q", "<Nop>")                -- disable macro recording
vim.keymap.set({ "v" }, "<Backspace>", "c")

-- quick exit
vim.api.nvim_create_user_command("Qa", function()
    vim.cmd("Neotree close")
    vim.cmd("qa")
end, {})

-- diagnostics
vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })
vim.keymap.set("n", "t",          vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })
vim.keymap.set("n", "<Space>d",   vim.diagnostic.open_float, { noremap = true, unique = true, desc = "view diagnostics" })

-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>",     { noremap = true, unique = true, desc = "exit terminal mode" })

-- wrap toggle
vim.keymap.set("n", "<leader>ww", "<cmd>set wrap<CR>",   { noremap = true, unique = true, desc = "turn on text wrap" })
vim.keymap.set("n", "<leader>wn", "<cmd>set nowrap<CR>", { noremap = true, unique = true, desc = "turn off text wrap" })

-- scroll
vim.keymap.set({ "n", "v", "c" }, "<ScrollWheelUp>",   "<Up>",       { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "c" }, "<ScrollWheelDown>", "<Down>",     { noremap = true, silent = true })
vim.keymap.set({ "i" },           "<ScrollWheelUp>",   "<C-o><C-y>", { noremap = true, silent = true })
vim.keymap.set({ "i" },           "<ScrollWheelDown>", "<C-o><C-e>", { noremap = true, silent = true })
vim.keymap.set("",                "<ScrollWheelLeft>", "<Left>",     { noremap = true, silent = true })
vim.keymap.set("",                "<ScrollWheelRight>","<Right>",    { noremap = true, silent = true })

vim.keymap.set("n", "<C-s>", "<C-d>", { noremap = true, silent = false, unique = true })
vim.keymap.set("n", "<C-j>", "<C-d>", { noremap = true, silent = false, unique = true })
vim.keymap.set("n", "<C-k>", "<C-u>", { noremap = true, silent = false, unique = true })

-- window navigation
vim.keymap.set("n", "<leader>]", "<C-w>l", { noremap = true, unique = true, desc = "switch to right window" })
vim.keymap.set("n", "<M-]>",     "<C-w>l", { noremap = true, unique = true, desc = "switch to right window" })
vim.keymap.set("n", "<leader>[", "<C-w>h", { noremap = true, unique = true, desc = "switch to left window" })
vim.keymap.set("n", "<M-[>",     "<C-w>h", { noremap = true, unique = true, desc = "switch to left window" })
vim.keymap.set("n", "<leader>=", "<C-w>k", { noremap = true, unique = true, desc = "switch to up window" })
vim.keymap.set("n", "<M-'>",     "<C-w>k", { noremap = true, unique = true, desc = "switch to up window" })
vim.keymap.set("n", "<leader>\\","<C-w>j", { noremap = true, unique = true, desc = "switch to down window" })
vim.keymap.set("n", "<M-\\>",    "<C-w>j", { noremap = true, unique = true, desc = "switch to down window" })

-- splits
vim.keymap.set("n", "<leader>ss", "<cmd>split<CR>", { noremap = true, unique = true, desc = "split horizontal" })
vim.keymap.set("n", "<leader>vs", "<cmd>vs<CR>",    { noremap = true, unique = true, desc = "split vertical" })

-- terminals
vim.keymap.set("n", "T",          "<cmd>terminal<CR>",                          { noremap = true, unique = true, desc = "terminal in current window" })
vim.keymap.set("n", "<leader>vt", "<cmd>vs<CR><cmd>terminal<CR>a",              { unique = true, desc = "terminal right" })
vim.keymap.set("n", "<leader>T",  "<cmd>split<CR><cmd>terminal<CR>8<C-W>_a",   { noremap = true, unique = true, desc = "terminal below" })

-- buffer
vim.keymap.set("n", "<Space>b", "<C-6>", { desc = "previous buffer", silent = false, unique = true, noremap = true })

-- file ops
vim.keymap.set("n", "<leader>rf", "<cmd>w<CR><cmd>e %<CR>",
    { silent = false, noremap = true, unique = true, desc = "reload current file" })
vim.keymap.set("n", "<leader>oc", "<cmd>!open \"%\"<CR>",
    { unique = true, noremap = true, desc = "open current file with default app" })
vim.keymap.set("n", "<leader>nedit", function()
    vim.api.nvim_set_current_dir(vim.fn.expand("~/.config/nvim/"))
end, { noremap = true, unique = true, silent = false, desc = "cd to nvim config" })

-- open config dir in neovim
vim.api.nvim_create_user_command("RunFile", function()
    local file = vim.fn.expand("%:p")
    local ext  = vim.fn.expand("%:e")
    local cmds = {
        hs  = "runghc",
        lua = "lua",
        py  = "python3",
        rs  = "cargo run",
        sh  = "zsh",
        js  = "node",
        r   = "/usr/local/bin/Rscript",
        R   = "/usr/local/bin/Rscript",
    }
    local cmd = cmds[ext]
    if cmd then
        vim.cmd("!" .. cmd .. " " .. file)
    else
        print("No run command configured for ." .. ext .. " files")
    end
end, {})
vim.keymap.set("n", "<leader>rr", ":RunFile<CR>",
    { unique = true, noremap = true, desc = "run current file" })

-- LSP
vim.keymap.set("n", "<Tab>",      "<cmd>lua vim.lsp.buf.hover()<CR>",
    { unique = true, noremap = true, desc = "hover docs" })
vim.keymap.set("n", "<leader>rv", vim.lsp.buf.rename,
    { noremap = true, unique = true, silent = false, desc = "rename variable" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { unique = true, desc = "LSP format" })
vim.keymap.set("n", "<leader>l",  vim.lsp.buf.format, { unique = true, desc = "LSP format" })
vim.keymap.set("n", "<A-l>",      vim.lsp.buf.format, { unique = true, desc = "LSP format" })
vim.keymap.set("n", "<leader>R",  vim.lsp.buf.references, { unique = true, desc = "symbol references" })
vim.keymap.set("n", "<space>l",   vim.lsp.codelens.run,
    { unique = true, noremap = true, silent = false, desc = "run code lens" })

-- formatter (filetype-aware external tool)
vim.keymap.set("n", "<leader>fmt", function()
    vim.cmd("w")
    local fullpath = vim.fn.expand("%:p")
    local ext      = vim.fn.expand("%:e")
    local par_dir  = vim.fn.expand("%:h")
    if ext == "rs" then
        vim.cmd("!cd " .. vim.fn.shellescape(par_dir) .. " && run fmt")
    elseif ext == "bib" then
        vim.cmd("!run bibfmt " .. vim.fn.shellescape(fullpath))
    else
        vim.notify("No formatter configured for *." .. ext, vim.log.levels.WARN)
        return
    end
    vim.cmd("e %")
end, { silent = false, noremap = true, unique = true, desc = "run filetype formatter" })

-- completions toggle
vim.keymap.set("n", "<leader>cme", function()
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.cmd('echo "Completions enabled"')
end, { noremap = true, silent = false, unique = true, desc = "enable completions" })
vim.keymap.set("n", "<leader>cmx", function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd('echo "Completions disabled"')
end, { noremap = true, silent = false, unique = true, desc = "disable completions" })

-- spellcheck
vim.keymap.set("n", "<leader>sc", "<cmd>setlocal spell spelllang=en_gb<CR>",
    { noremap = true, unique = true, desc = "enable spellchecking" })
vim.keymap.set("n", "<leader>-", "z=1",
    { unique = true, noremap = true, desc = "apply 1st spelling suggestion" })

-- colourizer
vim.keymap.set("n", "<leader>clr", "<cmd>ColorizerToggle<CR>",
    { noremap = true, unique = true, silent = false, desc = "toggle inline colour highlights" })

-- todo-comments
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- rust
vim.keymap.set("n", "<leader>ra", function()
    vim.cmd.RustLsp("codeAction")
end, { silent = false, unique = true, noremap = true, desc = "Rust code actions" })
vim.keymap.set({ "n", "v" }, "<leader>rj", function()
    vim.cmd.RustLsp("joinLines")
end, { silent = false, unique = true, noremap = true, desc = "Rust join lines" })

-- quarto
vim.keymap.set("n", "<leader>qp", "<cmd>QuartoPreview<CR>", { unique = true, desc = "quarto preview" })
