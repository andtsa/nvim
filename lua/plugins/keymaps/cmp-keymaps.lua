local cmp = require("cmp")

return {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<leader>ce"] = cmp.mapping.complete(), -- show completion suggestions
    ["<leader>x"] = cmp.mapping.abort(),     -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
}
