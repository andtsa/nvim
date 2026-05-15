-- require all core modules

require("core.options")
require("core.keymaps")
require("core.autocmd")

if vim.g.neovide then
    require("core.extras.neovide")
end

require("core.extras.alacritty")
