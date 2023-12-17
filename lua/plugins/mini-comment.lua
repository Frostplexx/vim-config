return {
    'echasnovski/mini.comment',
    event = "BufRead",
    version = false,
    lazy = false,
    config = function()
        require('mini.comment').setup()
    end
}
