-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    tag = '0.1.5',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    keys = {
        {
            "<leader><space>",
            function()
                require("telescope.builtin").find_files({
                    cwd = vim.loop.cwd(),
                })
            end,
            desc = "Find Files",
            remap = true,
            silent = true
        },
        { "<leader>fg", ":Telescope live_grep<cr>",           desc = "Live Grep",       silent = true },
        { "<leader>fh", ":Telescope help_tags<cr>",           desc = "Help Tags",       silent = true },
        { "<leader>ch", "<cmd>Telescope command_history<cr>", desc = "Command History", silent = true },
        { "<leader>km", ":Telescope keymaps<cr>",             desc = "Keymap",          silent = true },
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
