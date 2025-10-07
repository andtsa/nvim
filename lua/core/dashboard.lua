local dashboard = require("alpha.themes.dashboard")

-- Function to read ASCII art from a file
local function read_art_file(filepath)
    local lines = {}
    for line in io.lines(filepath) do
        table.insert(lines, line)
    end
    return lines
end
-- Set header using the art from the file
local art_filepath = vim.fn.stdpath('config') .. '/lua/core/artworks/planet.txt'
dashboard.section.header.val = read_art_file(art_filepath)

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = "#ffc080" })
dashboard.section.header.opts = {
    position = "center",
    hl = "DashboardHeader"
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("q   ", "  > Quit vim", "<cmd>qa<CR>"),
    -- dashboard.button("wr ", "  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
    dashboard.button("`cd ", "  > Change directory", "<cmd>Telescope file_browser<cr>"),
    dashboard.button("ff  ", "  > Find File", "<cmd>Telescope find_files<CR>"),
    dashboard.button("fs  ", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("\\   ", "  > Toggle file explorer", "<cmd>Neotree toggle<CR>"),
    dashboard.button("e   ", "  > New File", "<cmd>ene<CR>"),
    dashboard.button("q   ", "  > Quit vim", "<cmd>qa<CR>"),
}

dashboard.section.buttons.opts = {
    hl = "DashboardHeader"
}

-- Send config to alpha
require("alpha").setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
