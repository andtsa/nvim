return {
    "Rics-Dev/project-explorer.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        paths = { "~/", "~/proj/*", "~/uni/", "~/loop/8", "~/.config", "~/loop", "~/chess", "~/Documents/notes" }, --custom path set by user
        -- custom find command set by the user. Default should always work on unix unless user has heavily modified tools and/or PATH
        -- for Windows Users: installing `fd` is recommended with the equivalent `fd` command
        -- "fd . %s -td --min-depth %d --max-depth %d"
        command_pattern = "find %s -mindepth %d -maxdepth %d -type d -not -name '.git'",
        newProjectPath = "~/proj/", --custom path for new projects
        -- file_explorer = function(dir) --custom file explorer set by user
        --     vim.cmd("Neotree close")
        --     vim.cmd("Neotree " .. dir)
        -- end,
        -- Or for oil.nvim:
        -- file_explorer = function(dir)
        --   require("oil").open(dir)
        -- end,
    },
    config = function(_, opts)
        require("project_explorer").setup(opts)
    end,
    keys = {
        { "<leader>fp", "<cmd>ProjectExplorer<CR>",           desc = "Project Explorer" },
        { "<leader>fa", "<cmd>ProjectExplorerAddProject<CR>", desc = "Project Explorer" },
        { "mm",         "<cmd>ProjectExplorer<CR>",           desc = "Project Explorer" },
    },
    lazy = false,
}

-- To cd into a project just press Enter on the selected project.
-- To Add a project use <C-a>.
-- To add a project to favorite projects use <C-A-f>
-- To display favorite projects only use <C-f>.
