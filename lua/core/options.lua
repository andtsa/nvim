-- editor options

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.syntax         = "on"
vim.opt.autoindent     = true
vim.opt.cursorline     = true

vim.opt.expandtab      = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4

vim.opt.encoding       = "UTF-8"
vim.opt.ruler          = true
vim.opt.mouse          = "a"
vim.opt.title          = true
vim.opt.ttimeoutlen    = 0
vim.opt.wildmenu       = true

vim.opt.showcmd        = true
vim.opt.showmatch      = true
vim.opt.inccommand     = "split"

vim.opt.splitright     = true
vim.opt.splitbelow     = true

vim.opt.termguicolors  = true
vim.opt.wrap           = false
vim.opt.signcolumn     = "yes"
vim.opt.linebreak      = true

vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.colorcolumn    = "93"
vim.opt.scrolloff      = 4

vim.o.completeopt      = "menuone,noinsert,noselect"
vim.o.sessionoptions   = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shell            = "fish"

-- rounded borders on LSP hover/signature
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border    = "rounded",
    max_width = 80,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

-- detect Rust todo!() macros
vim.cmd("hi todo_macro ctermbg=128 guibg=#8000a7")
vim.cmd("autocmd BufWinEnter *.rs call matchadd('todo_macro', '^.*todo!().*$')")

-- use tree mode in netrw
vim.cmd("let g:netrw_liststyle = 3")
