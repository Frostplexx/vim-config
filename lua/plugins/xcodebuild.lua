return {
    "wojciech-kulik/xcodebuild.nvim",
    lazy = true,
    event = "BufRead *.swift",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("xcodebuild").setup()
    end,
}
