return {
    "barrett-ruth/live-server.nvim",
    lazy = true,
    event = "BufRead",
    build = "npm install -g live-server",
    config = function()
        require("live-server").setup()
    end,
}
