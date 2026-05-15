return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")

        fzf.setup({
            winopts = {
                height = 0.85,
                width  = 0.80,
                preview = { layout = "vertical", vertical = "down:45%" },
            },
            keymap = {
                fzf = {
                    ["ctrl-k"] = "prev-history",
                    ["ctrl-j"] = "next-history",
                },
            },
        })

        -- file finding
        vim.keymap.set("n", "ff", fzf.files,     { desc = "Find files" })
        vim.keymap.set("n", "fr", fzf.oldfiles,   { desc = "Recent files" })
        vim.keymap.set("n", "fs", fzf.live_grep,  { desc = "Live grep" })
        vim.keymap.set("n", "fc", fzf.grep_cword, { desc = "Grep word under cursor" })
        vim.keymap.set("v", "fs", fzf.grep_visual, { desc = "Grep selection" })
        vim.keymap.set("n", "ft", "<cmd>TodoFzfLua<cr>", { desc = "Find todos" })

        -- file browser / cwd navigation
        vim.keymap.set("n", "<leader>cd",    fzf.files, { desc = "Browse files" })
        vim.keymap.set("n", "<Space><Space>c", fzf.files, { desc = "Browse files" })

        -- LSP
        vim.keymap.set("n", "<leader>tr", fzf.lsp_references, { desc = "LSP references" })
        vim.keymap.set("n", "gd",          fzf.lsp_definitions, { desc = "Go to definition" })

        -- misc
        vim.keymap.set("n", "<leader>fc", fzf.colorschemes, { desc = "Colourscheme picker" })
        vim.keymap.set("n", "<leader>fb", fzf.buffers,      { desc = "Open buffers" })
    end,
}
