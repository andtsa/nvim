-- editor options

-- when using default file explorer, use tree mode
vim.cmd("let g:netrw_liststyle = 3")

-- detect rust todo macros and highlight them
vim.cmd("hi todo_macro ctermbg=128 guibg=#8000a7")
vim.cmd("autocmd BufWinEnter *.rs call matchadd('todo_macro', '^.*todo!().*$')")


vim.opt.number                         = true -- Print the line number in front of each line
vim.opt.relativenumber                 = true -- Show the line number relative to the line with the cursor in front of each line.
-- vim.opt.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.

vim.opt.syntax                         = "on" -- When this option is set, the syntax with this name is loaded.
vim.opt.autoindent                     = true -- Copy indent from current line when starting a new line.
vim.opt.cursorline                     = true -- Highlight the screen line of the cursor with CursorLine.

vim.opt.expandtab                      = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
vim.opt.shiftwidth                     = 4    -- Number of spaces to use for each step of (auto)indent.
vim.opt.tabstop                        = 4    -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop                    = 4

vim.opt.encoding                       = "UTF-8" -- Sets the character encoding used inside Vim.
vim.opt.ruler                          = true    -- Show the line and column number of the cursor position, separated by a comma.

vim.opt.mouse                          = "a"     -- Enable the use of the mouse. "a" you can use on all modes

vim.opt.title                          = true    -- When on, the title of the window will be set to the value of 'titlestring'
-- vim.opt.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
vim.opt.ttimeoutlen                    = 0       -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
vim.opt.wildmenu                       = true    -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.

vim.opt.showcmd                        = true    -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
vim.opt.showmatch                      = true    -- When a bracket is inserted, briefly jump to the matching one.
vim.opt.inccommand                     =
"split"                                          -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.

vim.opt.splitright                     = true
vim.opt.splitbelow                     = true -- When on, splitting a window will put the new window below the current one

vim.opt.termguicolors                  = true
vim.opt.wrap                           = false
vim.opt.signcolumn                     = "yes"
-- vim.opt.conceallevel   = 1

-- break on words not characters
vim.opt.linebreak                      = true

-- search settings
vim.opt.ignorecase                     = true -- ignore case when searching,
vim.opt.smartcase                      = true -- unless the query uses mixed case

-- Override the LSP hover handler to set a maximum width
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = 85, -- Adjust this value as needed
})

-- Override the LSP hover handler to disable text wrapping
local orig_hover                       = vim.lsp.handlers.hover
vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
    config = config or {}
    config.border = config.border or "rounded"
    config.max_width = config.max_width or 80 -- Set maximum width to prevent wrapping
    orig_hover(err, result, ctx, config)
    -- Disable wrapping in the hover window
    vim.api.nvim_win_set_option(0, 'wrap', false)
    local bufnr, winnr = vim.lsp.handlers.hover(_, result, ctx, config)
    if winnr then
        -- Override the LSP hover handler to disable the sign column
        vim.api.nvim_win_set_option(winnr, 'signcolumn', 'no')
    end
    return bufnr, winnr
end

-- -- Set the background colour for the hover window
-- vim.api.nvim_command('autocmd ColorScheme * highlight NormalFloat guibg=#1f2335')
--
-- -- Set the border colour for the hover window
-- vim.api.nvim_command('autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335')

-- enable completions by default
vim.o.completeopt                      = "menuone,noinsert,noselect"


-- instant configs
vim.g.instant_username = "andt"
