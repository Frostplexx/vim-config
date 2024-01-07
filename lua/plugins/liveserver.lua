return {
    "barrett-ruth/live-server.nvim",
    lazy = true,
    event = "VeryLazy",
    build = "npm install -g live-server",
    config = function()
        require("live-server").setup()
    end,
}
