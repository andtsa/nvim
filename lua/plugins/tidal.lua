return {
    "grddavies/tidal.nvim",
    opts = {
        --- Configure TidalLaunch command
        boot = {
            tidal = {
                --- Command to launch ghci with tidal installation
                cmd = "/Users/andtsa/.ghcup/bin/ghci-9.6.4",
                args = {
                    "-v0",
                },
                --- Tidal boot file path
                file = vim.api.nvim_get_runtime_file("bootfiles/BootTidal.hs", false)[1],
                enabled = true,
            },
            sclang = {
                --- Command to launch SuperCollider
                cmd = "/Applications/SuperCollider.app/Contents/MacOS/sclang",
                args = {},
                --- SuperCollider boot file
                file = vim.api.nvim_get_runtime_file("bootfiles/BootSuperDirt.scd", false)[1],
                enabled = false,
            },
            split = "v",
        },
        --- Default keymaps
        --- Set to false to disable all default mappings
        --- @type table | nil
        mappings = {
            send_line = { mode = { "i", "n" }, key = "<S-CR>" },
            send_visual = { mode = { "x" }, key = "<S-CR>" },
            send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
            send_node = { mode = "n", key = "<leader><CR>" },
            send_silence = { mode = "n", key = "<space>s" },
            send_hush = { mode = "n", key = "h" },
        },
        ---- Configure highlight applied to selections sent to tidal interpreter
        selection_highlight = {
            --- Highlight definition table
            --- see ':h nvim_set_hl' for details
            --- @type vim.api.keyset.highlight
            highlight = { link = "IncSearch" },
            --- Duration to apply the highlight for
            timeout = 150,
        },
    },
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "haskell", "supercollider" } },
    },
}
