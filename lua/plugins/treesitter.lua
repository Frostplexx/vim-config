return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    lazy = false,
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        auto_install = true,
        highlight = {
            enable = true,
        },
    },
}
