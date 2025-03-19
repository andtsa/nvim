-- Put anything you want to happen only in Neovide here
-- vim.o.guifont = "SF Mono Nerd Font:h12"

-- vim.g.neovide_text_gamma = 0.0
-- vim.g.neovide_text_contrast = 0.5

vim.g.neovide_padding_top = 1
vim.g.neovide_padding_bottom = 1
vim.g.neovide_padding_right = 1
vim.g.neovide_padding_left = 1


-- Helper function for transparency formatting
-- local alpha = function()
--     return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
-- end
-- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
-- vim.g.neovide_opacity = 0.5
-- vim.g.transparency = 0.8
-- vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.9

vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0

vim.g.neovide_show_border = false

-- vim.g.neovide_theme = 'auto'

vim.g.neovide_remember_window_size = true
