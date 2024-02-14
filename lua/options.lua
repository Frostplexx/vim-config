-- [[ Vim options ]]
vim.cmd.colorscheme "catppuccin-macchiato"

-- Make current line number brighter than the rest
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#8087a2", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#b4befe", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#8087a2", bold = false })


-- Fix status line blinking
vim.schedule(function() vim.cmd('redraw') end)

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.foldmethod = "manual"

-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- remove the INSERT text when in insert mode
vim.opt.showmode = false

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.api.nvim_set_option("clipboard", "unnamed")

vim.opt.smartindent = true
vim.opt.cmdheight = 1

-- set column width to 125
vim.opt.textwidth = 125
vim.opt.colorcolumn = "125"

-- set tab width to 4
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
