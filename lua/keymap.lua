-- [[ Keymaps that (re)map vim functions ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- remap Ctrl-W to <leader>w
vim.keymap.set("n", "<leader>w", "<C-W>", { desc = "Windows", noremap = false })

-- exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- remap redo to U
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo", noremap = false })

-- Builds XCode
vim.keymap.set("n", "<leader>cb", function()
    -- run the xcodegen command
    vim.cmd("echo 'Building XCode Project'")
    os.execute("xcodegen generate")
    vim.cmd("XcodebuildBuildRun")
end, { desc = "Builds XCode Project" })

--<leaer>po to exlpore projects folder
vim.keymap.set("n", "<leader>po", ":Explore ~/Documents/Development/ <cr><cr>",
    { desc = "Open Development Folder", silent = true })
-- <leader>ph to cd to the current file's directory
vim.keymap.set("n", "<leader>ph", ":cd %:p:h<cr>")

-- Undotree
vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })


-- Lazygit
vim.keymap.set("n", "<leader>gg", ":terminal lazygit <cr> i", { desc = "Lazygit" })


vim.keymap.set("n", "<leader>gb", ":!git blame -- % <cr>", { desc = "Git blame" })

-- Remap $ and ^ to move to the end and beginning of the line
vim.keymap.set("n", "H", "^", { noremap = true, desc = "Move to the beginning of the line" })
vim.keymap.set("n", "L", "$", { noremap = true, desc = "Move to the end of the line" })
vim.keymap.set("v", "H", "^", { noremap = true, desc = "Move to the beginning of the line" })
vim.keymap.set("v", "L", "$", { noremap = true, desc = "Move to the end of the line" })

-- Ctrl-a to select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

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

-- Search and replace in the whole file with confirmation, case-insensitive, and whole-word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
