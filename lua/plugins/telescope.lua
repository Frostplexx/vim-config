-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    tag = '0.1.5',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        { "<leader><space>", ":Telescope find_files<cr>", desc = "Find Files", remap = true, silent = true },
        { "<leader>fg",      ":Telescope live_grep<cr>",  desc = "Live Grep",  silent = true },
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
