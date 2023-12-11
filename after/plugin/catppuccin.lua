if vim.g.neovide then
  local macchiato_palette = require("catppuccin.palettes").get_palette("macchiato")
  vim.cmd([[
  hi Terminal guibg=NONE ctermbg=NONE cterm=NONE
  hi TermCursor guibg=NONE ctermbg=NONE cterm=NONE ctermfg=1 guifg=macchiato_palette.text
  hi TermCursorNC guibg=NONE ctermbg=NONE cterm=NONE ctermfg=1 guifg=macchiato_palette.text
  ]])

  vim.g.terminal_color_0 = macchiato_palette.base
  vim.g.terminal_color_1 = macchiato_palette.red
  vim.g.terminal_color_2 = macchiato_palette.green
  vim.g.terminal_color_3 = macchiato_palette.yellow
  vim.g.terminal_color_4 = macchiato_palette.blue
  vim.g.terminal_color_5 = macchiato_palette.pink
  vim.g.terminal_color_6 = macchiato_palette.teal
  vim.g.terminal_color_7 = macchiato_palette.subtext1
  vim.g.terminal_color_8 = macchiato_palette.yellow -- idk
  vim.g.terminal_color_9 = macchiato_palette.yellow -- idk
  vim.g.terminal_color_10 = macchiato_palette.yellow -- idk
  vim.g.terminal_color_11 = macchiato_palette.yellow -- idk
  vim.g.terminal_color_12 = macchiato_palette.yellow -- idk
  vim.g.terminal_color_13 = macchiato_palette.pink
  vim.g.terminal_color_14 = macchiato_palette.pink
  vim.g.terminal_color_15 = macchiato_palette.red
end

require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = true,
    mason = true,
    neotree = true,
    which_key = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
  },
})
