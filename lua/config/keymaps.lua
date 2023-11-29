-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- map tab to switch buffers and shift tab to switch buffers in reverse

local map = vim.keymap.set
map("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer", remap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", remap = true, silent = true })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark a file in Harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle Haproon quick Menu" })

vim.keymap.set("n", "<leader>1", function()
  ui.nav_file(1)
end, { desc = "Go to 1. marked file" })
vim.keymap.set("n", "<leader>2", function()
  ui.nav_file(2)
end, { desc = "Go to 2. marked file" })
vim.keymap.set("n", "<leader>3", function()
  ui.nav_file(3)
end, { desc = "Go to 3. marked file" })
vim.keymap.set("n", "<leader>4", function()
  ui.nav_file(4)
end, { desc = "Go to 4. marked file" })

-- Undotree
vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
