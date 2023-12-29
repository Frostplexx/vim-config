return {
    "anuvyklack/windows.nvim",
    enabled = false,
    lazy = false,
    event = "BufWinEnter",
    config = function()
        require('windows').setup()
    end,
    dependencies = {
        "anuvyklack/middleclass"
    },
    keys = {
        { "<leader>wm", ":WindowsMaximize<cr>", desc = "Maximise Window", silent = true }
    },
}
