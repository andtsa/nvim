vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        print("[auto detecting theme]")
        -- Read ~/.config/alacritty/alacritty.toml
        local path = vim.fn.expand("~/.config/alacritty/alacritty.toml")
        local file = io.open(path, "r")
        if not file then
            vim.notify("Failed to open alacritty.toml", vim.log.levels.WARN)
            return
        end

        local is_light = false
        for line in file:lines() do
            if line:match("#%s*THEME%s*=%s*LIGHT") then
                is_light = true
                break
            end
        end
        file:close()

        -- Always toggle if theme is light
        if is_light then
            vim.o.background = "light"
            vim.cmd("CyberdreamToggleMode")
        else
            vim.o.background = "dark"
        end
    end,
})
