return {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>tr", ":TroubleToggle<cr>", desc = "Trouble" },
    }
}
