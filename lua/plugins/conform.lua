return {
    "stevearc/conform.nvim",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                swift = { "swiftformat_ext" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
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

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
