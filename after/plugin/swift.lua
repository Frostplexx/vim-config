-- Code Formatting with conform
local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    swift = { "swiftformat_ext" },
  },
  -- format_on_save = {
  -- 	timeout_ms = 500,
  -- 	lsp_fallback = true,
  -- },
  format_on_save = nil,
  log_level = vim.log.levels.ERROR,
  formatters = {
    swiftformat_ext = {
      command = "swiftformat",
      args = { "--config", "~/.config/nvim/.swiftformat", "--stdinpath", "$FILENAME" },
      range_args = function(ctx)
        return {
          "--config",
          "~/.config/nvim/.swiftformat",
          "--linerange",
          ctx.range.start[1] .. "," .. ctx.range["end"][1],
        }
      end,
      stdin = true,
      condition = function(ctx)
        return vim.fs.basename(ctx.filename) ~= "README.md"
      end,
    },
  },
})

-- Enable swift lsp
require("lspconfig").sourcekit.setup({})

local lint = require("lint")
-- swiftlint
local pattern = "[^:]+:(%d+):(%d+): (%w+): (.+)"
local groups = { "lnum", "col", "severity", "message" }
local defaults = { ["source"] = "swiftlint" }
local severity_map = {
  ["error"] = vim.diagnostic.severity.ERROR,
  ["warning"] = vim.diagnostic.severity.WARN,
}

lint.linters.swiftlint = {
  name = "swiftlint",
  cmd = "swiftlint",
  stdin = true,
  args = {
    "lint",
    "--use-stdin",
    "--config",
    os.getenv("HOME") .. "/.config/nvim/.swiftlint.yml",
    "-",
  },
  stream = "stdout",
  ignore_exitcode = true,
  parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
}

-- setup
lint.linters_by_ft = {
  swift = { "swiftlint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

vim.keymap.set("n", "<leader>ml", function()
  require("lint").try_lint()
end, { desc = "Lint file" })
