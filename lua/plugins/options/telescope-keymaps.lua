-- nvim/lua/plugins/options/telescope-keymaps.lua
-- keymaps for telescope

vim.keymap.set("n", "ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
vim.keymap.set("n", "fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })

vim.keymap.set("n", "ft", "<cmd>TodoTelescope<cr>", { desc = "Find todo comments" })
