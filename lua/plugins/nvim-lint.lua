return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
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
    end,
}
