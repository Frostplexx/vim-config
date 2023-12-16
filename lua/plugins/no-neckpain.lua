return {
    "shortcuts/no-neck-pain.nvim",
    lazy = false,
    opts = {
        width = 150,
        buffers = {
            colors = {
                blend = -0.2,
                backgroundColor = "catppuccin-machiatto",
            },
            scratchPad = {
                -- set to `false` to
                -- disable auto-saving
                enabled = true,
                -- set to `nil` to default
                -- to current working directory
                location = "~/Documents/",
                fileName = "notes",
            },
            bo = {
                filetype = "md",
            },
        },
    },
}
