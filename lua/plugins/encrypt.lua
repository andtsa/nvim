return {
    'kurotych/ccryptor.nvim',
    config = function()
        require("ccryptor").setup({
            dir_path = '/Users/andtsa/.sec/'
        })
    end
}
