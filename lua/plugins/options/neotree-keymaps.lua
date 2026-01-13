-- nvim/lua/plugins/keymaps/neotree-keymaps.lua

-- vim.keymap.set("n", "<leader>b", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<leader>v", ":Neotree toggle<CR>")

vim.keymap.set("n", "\\", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>Neotree float git_status<CR>")

vim.cmd([[
    highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
]])
