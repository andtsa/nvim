-- nvim/lua/plugins/options/auto-sessions-keymaps.lua

vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current workdir" }) -- restore last workspace session for current directory
vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
