-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- map tab to switch buffers and shift tab to switch buffers in reverse

local map = vim.keymap.set
map("n", "<Tab>", ":bnext<CR>", { desc = "Go to next buffer", remap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous buffer", remap = true, silent = true })
