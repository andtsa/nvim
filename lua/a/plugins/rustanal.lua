return {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
        require('rustaceanvim').setup({
            treesitter = {
                enable = true,
            }
        })
    end
}
