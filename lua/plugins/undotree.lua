return {
    "mbbill/undotree",
    event = "BufRead",
    lazy = false,
    keys = {
        { "<leader>cu", ":UndotreeToggle<CR>", desc = "Toggle undotree", silent = true }
    }
}
