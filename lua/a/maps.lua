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

vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
-- -- You can also specify a list of valid jump keywords
--
-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })


-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function() 
--         vim.cmd("hi todo_macro ctermbg=128 guibg=#8000a7")
--         vim.cmd("autocmd BufWinEnter *.log call matchadd('todo_macro', '^.*todo!().*$')")
--     end,
-- })

map('n', '<leader>d', vim.diagnostic.open_float)

-- Function to enable completions
vim.keymap.set('n', '<leader>c', function()
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.cmd('echo "Completions enabled"')
end, { noremap = true, silent = true })

-- Function to disable completions
vim.keymap.set('n', '<leader>x', function()
    vim.o.completeopt = "menuone,noselect"
    vim.cmd('echo "Completions disabled"')
end, { noremap = true, silent = true })

map('v', 'u', 'y')

vim.keymap.set('n', '<leader>h', function()
    require('lsp-inlayhints').toggle()
end, { noremap = true, silent = true, desc = "Toggle Inlay Hints" })


-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

