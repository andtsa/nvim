-- key mappings

vim.g.mapleader = "`"

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true })
end


-- moving between vsplit
map("n", "<leader>]", "<C-w>l")
map("n", "<leader>[", "<C-w>h")

map("n", "q", "<Nop>")

-- Remap scroll up to behave like the up arrow key
vim.api.nvim_set_keymap('', '<ScrollWheelUp>', '<Up>', { noremap = true, silent = true })

-- Remap scroll down to behave like the down arrow key
vim.api.nvim_set_keymap('', '<ScrollWheelDown>', '<Down>', { noremap = true, silent = true })

vim.o.scrolloff = 4

-- Remap scroll up to behave like the up arrow key
vim.api.nvim_set_keymap('', '<ScrollWheelLeft>', '<Left>', { noremap = true, silent = true })

-- Remap scroll down to behave like the down arrow key
vim.api.nvim_set_keymap('', '<ScrollWheelRight>', '<Right>', { noremap = true, silent = true })

-- change between light and dark mode
map("n", "<leader>tt", ":CyberdreamToggleMode<CR>")

-- copy text
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = false })

-- Open file browser
map('n', '<leader>b', ':Neotree toggle<CR>')
map('n', '<leader>n', ':Neotree toggle<CR>')
map('n', '<leader>v', ':Neotree toggle<CR>')
