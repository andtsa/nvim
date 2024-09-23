-- nvim/lua/plugins/keymaps/nvim-tree.lua
-- configure keyboard shortcuts for nvim-tree

-- toggle the file explorer with fat finger support
vim.keymap.set("n", "<leader>v", "<cmd>NvimTreeToggle<CR>", { silent = false, noremap = true, unique = true })
vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { silent = false, noremap = true, unique = true })
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { silent = false, noremap = true, unique = true })

-- not really sure what this one is
vim.keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle", { silent = false, noremap = true, unique = true })

-- collapse tree view
vim.keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { silent = false, noremap = true, unique = true })

-- refresh tree view
vim.keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { silent = false, noremap = true, unique = true })
