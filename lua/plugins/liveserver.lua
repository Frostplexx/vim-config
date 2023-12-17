return {
    "barrett-ruth/live-server.nvim",
    event = "VeryLazy",
    build = "npm install -g live-server",
    config = function()
        require("live-server").setup()
    end,
    lazy = false,
}
