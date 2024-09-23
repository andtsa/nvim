-- nvim/lua/plugins/options/telescope-keymaps.lua    
-- keymaps for telescope

vim.keymap.set("n", "ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

vim.keymap.set("n", "ft", "<cmd>TodoTelescope<cr>", { desc = "Find todo comments" })


