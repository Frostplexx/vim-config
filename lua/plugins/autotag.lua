return {
    "windwp/nvim-ts-autotag",
    event = "BufRead",
    config = function()
        require('nvim-ts-autotag').setup()
        require 'nvim-treesitter.configs'.setup {
            autotag = {
                enable = true,
            }
        }
    end
}
