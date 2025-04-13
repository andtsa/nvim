-- nvim/lua/plugins/options/telescope-keymaps.lua
-- keymaps for telescope

vim.keymap.set("n", "ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
vim.keymap.set("n", "fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })

vim.keymap.set("v", "fs", function()
    local selected_text = vim.fn.getreg("v") -- Get selected text from visual mode register
    vim.fn.setreg("/", selected_text)      -- Set it as the last search pattern
    require("telescope.builtin").live_grep({ default_text = selected_text })
end, { desc = "Find selected text in cwd" })

vim.keymap.set("n", "ft", "<cmd>TodoTelescope<cr>", { desc = "Find todo comments" })
