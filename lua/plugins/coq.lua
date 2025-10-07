return {
    'tomtomjhj/vscoq.nvim',
    filetypes = 'coq',
    dependecies = {
        'neovim/nvim-lspconfig',
        'whonore/Coqtail',
    },
    opts = {
        vscoq = {
            diagnostics = {
                full = true
            },
            goals = {
                messages = { full = true }
            },
            proof = {
                pointInterpretationMode = "NextCommand", -- include current sentence
                cursor = { sticky = false },
            },
            completion = {
                enable = true,
            },
        },
        lsp = {
            cmd = { "/Applications/Coq-Platform~8.20~2025.01.app/Contents/Resources/bin/vscoqtop" },
            trace = "verbose"
        }
    }
}
