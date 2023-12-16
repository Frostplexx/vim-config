-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { "<Space><Space>", ":Telescope find_files<cr>", desc = "Find Files", remap = true, silent = true },
        { "<Tab>",
            function()
                local builtin = require("telescope.builtin")

                builtin.buffers({
                    sort_mru = true,
                    ignore_current_buffer = true,
                })
            end
        },
        desc = "Go to next buffer",
        remap = true,
        silent = true
    }
}
