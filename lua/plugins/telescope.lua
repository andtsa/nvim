return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        "xiyaowong/telescope-emoji.nvim",
        "nvim-telescope/telescope-bibtex.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("emoji")
        telescope.load_extension("bibtex")
        -- telescope.load_extension('hoogle')
        --

        local ok_builtin, builtin = pcall(require, "telescope.builtin")
        if not ok_builtin then
            print("Telescope builtin module not found.")
            return
        end

        local function find_and_set_cwd()
            builtin.find_files({
                prompt_title = "Select Directory",
                find_command = { "fd", "--type", "d", "--follow" }, -- `fd` to list only directories
                attach_mappings = function(prompt_bufnr, map)
                    local action_state = require("telescope.actions.state")

                    local function set_cwd()
                        local selection = action_state.get_selected_entry()
                        local dir = selection[1]
                        actions.close(prompt_bufnr)
                        vim.cmd("cd " .. dir)
                        print("Changed working directory to: " .. dir)
                    end

                    map("i", "<CR>", set_cwd)
                    map("n", "<CR>", set_cwd)
                    return true
                end,
            })
        end

        vim.keymap.set("n", "<leader>cd", find_and_set_cwd,
            { unique = true, silent = false, desc = "Find and set working directory" })
        -- vim.keymap.set("n", "m", find_and_set_cwd,
        --     { unique = true, silent = false, desc = "Find and set working directory" })

        vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<CR>",
            { unique = true, noremap = true, silent = false, desc = "find & insert emoji" })
    end,
}
