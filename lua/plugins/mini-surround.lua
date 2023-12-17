return {
    'echasnovski/mini.surround',
    event = "BufRead",
    lazy = false,
    version = '*',
    config = function()
        require('mini.surround').setup()
    end
}
