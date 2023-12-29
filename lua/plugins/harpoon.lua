return {
    "ThePrimeagen/harpoon",
    lazy = true,
    event = "BufRead",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({})

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Mark a file in Harpoon" })

        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end, { desc = "Go to 1. marked file" })
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end, { desc = "Go to 2. marked file" })
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end, { desc = "Go to 3. marked file" })
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end, { desc = "Go to 4. marked file" })
    end,
    dependencies = {
        "nvim-lua/plenary.nvim",
    }
}
