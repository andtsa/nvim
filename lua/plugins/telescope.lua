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
        local fb_actions = telescope.extensions.file_browser.actions

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
            extensions = {
                file_browser = {
                    -- your other file_browser opts …
                    mappings = {
                        ["i"] = {
                            ["<C-e>"] = function(prompt_bufnr)
                                fb_actions.change_cwd(prompt_bufnr)
                            end,
                            ["<CR>"] = function(prompt_bufnr)
                                fb_actions.change_cwd(prompt_bufnr)
                            end,
                        },
                        ["n"] = {
                            ["<C-e>"] = fb_actions.change_cwd,
                            ["<CR>"] = fb_actions.change_cwd,
                        },
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("emoji")
        telescope.load_extension("bibtex")
        telescope.load_extension("file_browser")
        -- telescope.load_extension('hoogle')
        --

        -- local ok_builtin, builtin = pcall(require, "telescope.builtin")
        -- if not ok_builtin then
        --     print("Telescope builtin module not found.")
        --     return
        -- end

        -- local function find_and_set_cwd()
        --     builtin.find_files({
        --         prompt_title    = "Select Directory",
        --         cwd             = vim.fn.getcwd(),
        --         find_command    = { "ls", "-alu" },
        --         -- find_command    = { "fd", "--type", "d", "--max-depth", "7", "-a", "-i", "-H", "--max-results", "1024", "--follow" }, -- `fd` to list only directories
        --         attach_mappings = function(prompt_bufnr, map)
        --             local actions_state = require("telescope.actions.state")
        --
        --             local function set_cwd()
        --                 local entry = actions_state.get_selected_entry()
        --                 actions.close(prompt_bufnr)
        --                 vim.cmd("cd " .. vim.fn.fnameescape(entry[1]))
        --                 print("Changed working directory to: " .. entry[1])
        --             end
        --
        --             map("i", "<CR>", set_cwd)
        --             map("n", "<CR>", set_cwd)
        --             return true
        --         end,
        --     })
        -- end

        vim.keymap.set("n", "<leader>cd", "<cmd>Telescope file_browser<CR>",
            { unique = true, silent = false, desc = "Find and set working directory" })
        vim.keymap.set("n", "<Space><Space>c", "<cmd>Telescope file_browser<CR>",
            { unique = true, silent = false, desc = "Find and set working directory" })
        -- vim.keymap.set("n", "<leader>cd", find_and_set_cwd,
        --     { unique = true, silent = false, desc = "Find and set working directory" })
        -- vim.keymap.set("n", "m", find_and_set_cwd,
        --     { unique = true, silent = false, desc = "Find and set working directory" })

        vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<CR>",
            { unique = true, noremap = true, silent = false, desc = "find & insert emoji" })
    end,
}
