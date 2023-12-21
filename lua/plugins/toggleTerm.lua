return {
    "akinsho/toggleterm.nvim",
    lazy = true,
    config = function()
        require("toggleterm").setup()
    end,
    keys = {
        { "<leader>bt", ":ToggleTerm direction=horizontal<cr>", desc = "Bottom Terminal" },
        { "<leader>bT", ":ToggleTerm direction=float<cr>",      desc = "Floating Terminal" }
    }
}
