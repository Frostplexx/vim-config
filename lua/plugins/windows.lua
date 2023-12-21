return {
    "anuvyklack/windows.nvim",
    lazy = true,
    config = function()
        require('windows').setup()
    end,
    dependencies = {
        "anuvyklack/middleclass"
    },
    keymaps = {
        { "<leader>wm", vim.cmd.WindowsMaximise, desc = "Maximise Window", silent = true }
    },
}
