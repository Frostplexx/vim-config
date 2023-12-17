return {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    event = "BufRead",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", ":LazyGit<CR>", desc = "Open LazyGit", noremap = true, silent = true },
    }
}
