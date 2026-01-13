return {
    'whonore/Coqtail',
    lazy = false,
    priority = 200,
    init = function()
        -- vim.g.loaded_coqtail = 1
        vim.g["coqtail#supported"] = 0
    end,
}
