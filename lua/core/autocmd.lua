-- auto-commands

-- vim.api.nvim_create_autocmd({event}, {*opts})
--
-- {event}: (string or array) events that will trigger the handler
--      * BufEnter: after entering a buffer
--      * CmdlineLeave: before leaving the command-line
--      * See all available events with :h autocmd-events.
--
-- {opts}: options
--      * pattern (string or array): pattern to match
--      * callback (function or string): Lua function called when the event is triggered
--      * See all available options with :h nvim_create_autocmd.
--
-- example:
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.lua",
--     callback = function()
--         vim.lsp.buf.format()
--     end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPre", {
--     pattern = "*.*",
--     callback = function()
--         vim.opt.linebreak = true
--         vim.opt.wrap = true
--     end
-- })

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = "*.qmd",
--     callback = function()
--         vim.fn.jobstart({ "quarto", "format", vim.fn.expand("%") }, { detach = true })
--     end,
-- })

-- Enable inlay hints when the LSP attaches
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function()
--         vim.lsp.inlay_hints.enable()
--     end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        vim.cmd("ColorizerAttachToBuffer")
    end
})

-- vim.api.nvim_create_autocmd('CursorHold', {
--     pattern = '*.rs',
--     callback = function()
--         vim.lsp.buf.hover()
--     end,
-- })
--

-- vim.cmd([[
--   augroup HaskellConceal
--     autocmd!
--     autocmd FileType hs setlocal conceallevel=2
--     autocmd FileType hs syntax match hsLambda "\\" conceal cchar=λ
--   augroup END
-- ]])


-- coqtail highlight

local grp = vim.api.nvim_create_augroup("CoqtailHighlight", { clear = true })

local function apply_coqtail_hl()
    local dark = vim.o.background == "dark"

    local palette = dark and {
        checked = { gui = "#113311", cterm = 22 },  -- ~dark forest green
        sent    = { gui = "#0b5f3b", cterm = 29 },  -- ~teal-green
    } or {
        checked = { gui = "#CFF69F", cterm = 157 }, -- ~LightGreen
        sent    = { gui = "#B7F0C1", cterm = 120 }, -- ~LimeGreen-ish
    }

    vim.api.nvim_set_hl(0, "CoqtailChecked", { bg = palette.checked.gui, nocombine = true })
    vim.api.nvim_set_hl(0, "CoqtailSent", { bg = palette.sent.gui, nocombine = true })

    -- fallback for non-truecolor terminals
    if not vim.go.termguicolors then
        vim.cmd(("hi default CoqtailChecked ctermbg=%d"):format(palette.checked.cterm))
        vim.cmd(("hi default CoqtailSent ctermbg=%d"):format(palette.sent.cterm))
    end
end

-- Reapply when colorscheme changes or when :set background=…
vim.api.nvim_create_autocmd("ColorScheme", {
    group = grp,
    callback = function() vim.defer_fn(apply_coqtail_hl, 10) end, -- small delay
})
vim.api.nvim_create_autocmd("OptionSet", { group = grp, pattern = "background", callback = apply_coqtail_hl })

-- define a transparent cursorline style once
vim.api.nvim_set_hl(0, "CursorLineTransparent", { bg = "NONE", nocombine = true })
vim.api.nvim_set_hl(0, "CursorLineNrStrong", { bold = true })

local cl_grp = vim.api.nvim_create_augroup("CoqCursorlineWinHL", { clear = true })

local function apply_coq_winhighlight(win)
    -- Only tweak if the buffer is coq
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype ~= "coq" then return end

    vim.wo[win].cursorline = true
    -- Show highlight only on the number, no line bg
    vim.wo[win].cursorlineopt = "number"
    -- Make CursorLine transparent and strengthen CursorLineNr
    vim.wo[win].winhighlight =
    "CursorLine:CursorLineTransparent,CursorLineNr:CursorLineNrStrong"
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "coq",
    callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        vim.keymap.set("n", "<A-Right>", ":VsCoq stepForward<CR>", opts)
        vim.keymap.set("n", "<A-Left>", ":VsCoq stepBackward<CR>", opts)
        -- apply once
        apply_coqtail_hl()
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    group = cl_grp,
    pattern = "coq",
    callback = function(args) apply_coq_winhighlight(vim.fn.bufwinid(args.buf)) end,
})
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    group = cl_grp,
    callback = function() apply_coq_winhighlight(vim.api.nvim_get_current_win()) end,
})
