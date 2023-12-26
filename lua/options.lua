-- [[ Vim options ]]

vim.g.cmdheight = 0
vim.cmd.colorscheme "catppuccin-macchiato"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.autochdir = true

vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.cmdheight = 0

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- open compiled tex files in skim
vim.g.vimtex_view_method = "skim"

-- [[ Neovide Config ]]
-- only runs when in neovide
if vim.g.neovide then
    vim.o.guifont = "JetbrainsMono Nerd Font:h13"
    vim.g.neovide_padding_top = 15
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- I live in the shadows
    vim.g.neovide_floating_shadow = false

    vim.g.neovide_scroll_animation_far_lines = 5
    vim.g.neovide_hide_mouse_when_typing = true

    -- Smoooooooooth
    vim.g.neovide_refresh_rate = 144
    vim.g.neovide_refresh_rate_idle = 1
    vim.o.termguicolors = true
    vim.g.neovide_no_idle = false

    -- Is this a videogame?
    vim.g.neovide_cursor_antialiasing = true

    -- The ricing corner
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
