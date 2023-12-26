return {
    "wojciech-kulik/xcodebuild.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("xcodebuild").setup({
            -- put some options here or leave it empty to use default settings
        })
    end,
}
