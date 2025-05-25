return {
    'everviolet/nvim',
    name = 'evergarden',
    opts = {
        theme = {
            variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
            accent = 'blue',
        },
        editor = {
            transparent_background = false,
            sign = { color = 'none' },
            float = {
                color = 'mantle',
                invert_border = false,
            },
            completion = {
                color = 'surface0',
            },
        },
    }
}
