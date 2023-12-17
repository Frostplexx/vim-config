return {
    'echasnovski/mini.pairs',
    event = "BufRead",
    version = false,
    lazy = false,
    config = function()
        require('mini.pairs').setup()
    end
}
