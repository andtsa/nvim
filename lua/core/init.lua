-- require all of core

-- editor vim.opt(s)
require("core.options")

-- shortcuts
require("core.keymaps")

-- autocmd's
require("core.autocmd")

-- neovide-only configs
if vim.g.neovide then
    require("core.extras.neovide")
end

-- vim.loader.enable()

-- get plugin-specific configs from nvim/lua/plugins/options/*.lua
local keymap_dir = vim.fn.stdpath('config') .. '/lua/plugins/options/'
for _, file in ipairs(vim.fn.readdir(keymap_dir)) do
    if file:match('%.lua$') then -- only .lua files
        -- .. and execute the contents
        dofile(keymap_dir .. file)
    end
end

-- after plugins loaded, load extras
-- require("core.extras.cd")

-- auto detect if theme is light
require("core.extras.alacritty")
