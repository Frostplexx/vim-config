local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons

require("battery").setup({
  update_rate_seconds = 300,
  show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
  show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
  show_unplugged_icon = false, -- When true show a diconnected cable icon when not plugged in
  show_percent = true, -- Whether or not to show the percent charge remaining in digits
  vertical_icons = false, -- When true icons are vertical, otherwise shows horizontal battery icon
})

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    section_separators = { left = "", right = "" },
    disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        separator = { left = "" },
        right_padding = 0,
      },
    },
    lualine_b = { "branch" },

    lualine_c = {
      Util.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { Util.lualine.pretty_path() },
    },
    lualine_x = {
      {
        function()
          return require("noice").api.status.mode.get()
        end,
        cond = function()
          return package.loaded["noice"] and require("noice").api.status.mode.has()
        end,
        color = Util.ui.fg("Constant"),
      },
      {
        function()
          return "  " .. require("dap").status()
        end,
        cond = function()
          return package.loaded["dap"] and require("dap").status() ~= ""
        end,
        color = Util.ui.fg("Debug"),
      },
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = Util.ui.fg("Special"),
      },
      {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
    },
    lualine_y = {
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
        separator = "",
        padding = { left = 0, right = 0 },
      },
      {
        function()
          return require("battery").get_status_line()
        end,
        separator = { right = "" },
        left_padding = 0,
      },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = { "neo-tree", "lazy" },
})
