return {
    "folke/trouble.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>tr", ":TroubleToggle<cr>", desc = "Trouble" },
    }
}
