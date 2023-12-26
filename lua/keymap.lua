-- [[ Keymaps that (re)map vim functions ]]
vim.g.mapleader = " "

-- gf passthrough for obsidian
vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })

-- vim.keymap.set("n", "<leader>cp", function()
--     -- get copilot status
--     if vim.g.copilot then
--         -- if copilot is on, turn it off
--         vim.g.copilot = false
--         vim.cmd("Copilot disable")
--         vim.cmd("echo 'Copilot disabled'")
--     else
--         -- if copilot is off, turn it on
--         vim.g.copilot = true
--         vim.cmd("Copilot enable")
--         vim.cmd("echo 'Copilot enabled'")
--     end
-- end, { desc = "Toggle Copilot" })

-- remap Ctrl-W to <leader>w
vim.keymap.set("n", "<leader>w", "<C-W>", { desc = "Windows", noremap = false })

-- Builds XCode
vim.keymap.set("n", "<leader>cb", function()
    -- run the xcodegen command
    vim.cmd("echo 'Building XCode Project'")
    os.execute("xcodegen generate")
    vim.cmd("XcodebuildBuildRun")
end, { desc = "Builds XCode Project" })

vim.keymap.set("n", "<leader>po", ":Explore ~/Documents/Development/ <CR>", { desc = "Open Development Folder" })

-- no neck pain
vim.keymap.set("n", "<leader>wp", vim.cmd.NoNeckPain, { desc = "Center Code" })

-- Undotree
vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

vim.keymap.set("n", "<leader>bT", ":ToggleTerm direction=float <CR>", { desc = "Open terminal" })
vim.keymap.set("n", "<leader>bt", ":ToggleTerm direction=horizontal <CR>", { desc = "Open horizontal terminal split" })

-- Rearrange visually selected lines in normal mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Join lines in normal mode after moving to the end of the line
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll down half a screen in normal mode, keeping the cursor in the same position
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll up half a screen in normal mode, keeping the cursor in the same position
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move to the next search result and center the screen
vim.keymap.set("n", "n", "nzzzv")

-- Move to the previous search result and center the screen
vim.keymap.set("n", "N", "Nzzzv")

-- Delete selected text in visual mode and paste it at the cursor position
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Yank to system clipboard from cursor to end of line in normal mode
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete selected text in normal and visual mode without affecting the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disable Ex mode when pressing Q in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Open a new tmux window running 'tmux-sessionizer' in normal mode
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the current buffer using LSP (Language Server Protocol)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move to the next quickfix entry and center the screen
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Move to the previous quickfix entry and center the screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Move to the next location list entry and center the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Move to the previous location list entry and center the screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace in the whole file with confirmation, case-insensitive, and whole-word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add executable permission to the current file in normal mode
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Run a custom command to simulate making it rain in normal mode
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Open the Packer configuration file for editing in normal mode
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
