return {
    'echasnovski/mini.nvim',
    version = false,
    lazy = true,
    event = "WinEnter",
    enabled = true,
    dependencies = {
        {
            "frostplexx/lazyBattery.nvim",
            enabled = false,
            config = function()
                require("battery").setup({
                    update_rate_seconds = 300,
                    show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
                    show_plugged_icon = true,           -- If true show a cable icon alongside the battery icon when plugged in
                    show_unplugged_icon = false,        -- When true show a diconnected cable icon when not plugged in
                    show_percent = true,                -- Whether or not to show the percent charge remaining in digits
                    vertical_icons = false,             -- When true icons are vertical, otherwise shows horizontal battery icon
                })
            end

        },
        {
            "lewis6991/gitsigns.nvim",
            lazy = true,
            event = "VeryLazy",
            config = function()
                require('gitsigns').setup()
            end

        }
    },
    config = function()
        -- [[ Mini Indetenscope ]]
        require('mini.indentscope').setup({
            -- Draw options
            draw = {
                -- Delay (in ms) between event and start of drawing scope indicator
                delay = 0,
                animation = require('mini.indentscope').gen_animation.none()
            },

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Textobjects
                object_scope = 'ii',
                object_scope_with_border = 'ai',

                -- Motions (jump to respective border line; if not present - body line)
                goto_top = '[i',
                goto_bottom = ']i',
            },

            -- Options which control scope computation
            options = {
                -- Type of scope's border: which line(s) with smaller indent to
                -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
                border = 'both',

                -- Whether to use cursor column when computing reference indent.
                -- Useful to see incremental scopes with horizontal cursor movements.
                indent_at_cursor = true,

                -- Whether to first check input line to be a border of adjacent scope.
                -- Use it if you want to place cursor on function header to get scope of
                -- its body.
                try_as_border = false,
            },

            -- Which character to use for drawing scope indicator
            symbol = '│',
        })

        -- [[ Mini Bufremove ]]
        require('mini.bufremove').setup()

        -- [[ Mini Comment ]]
        require('mini.comment').setup()

        -- [[ Mini Files ]]
        require('mini.files').setup(
        -- No need to copy this inside `setup()`. Will be used automatically.
            {
                -- Customization of shown content
                content = {
                    -- Predicate for which file system entries to show
                    filter = nil,
                    -- What prefix to show to the left of file system entry
                    prefix = nil,
                    -- In which order to show file system entries
                    sort = nil,
                },

                -- Module mappings created only inside explorer.
                -- Use `''` (empty string) to not create one.
                mappings = {
                    close       = 'q',
                    go_in_plus  = '<cr>',
                    go_out      = 'h',
                    go_out_plus = 'H',
                    reset       = '<BS>',
                    reveal_cwd  = '@',
                    show_help   = 'g?',
                    synchronize = '=',
                    trim_left   = '<',
                    trim_right  = '>',
                },

                -- General options
                options = {
                    -- Whether to delete permanently or move into module-specific trash
                    permanent_delete = false,
                    -- Whether to use for editing directories
                    use_as_default_explorer = true,
                },

                -- Customization of explorer windows
                windows = {
                    -- Maximum number of windows to show side by side
                    max_number = math.huge,
                    -- Whether to show preview of file/directory under cursor
                    preview = true,
                    -- Width of focused window
                    width_focus = 50,
                    -- Width of non-focused window
                    width_nofocus = 10,
                    -- Width of preview window
                    width_preview = 25,
                },
            }
        )

        -- [[ Mini Pairs ]]
        require('mini.pairs').setup()

        -- [[ Mini Surround ]]
        require('mini.surround').setup()

        -- -- [[ Mini Notify ]]
        -- require('mini.notify').setup()
        -- vim.notify = require('mini.notify').make_notify()

        -- [[ Mini Cursorword ]]
        require('mini.cursorword').setup()

        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<Leader>' },
                { mode = 'x', keys = '<Leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- enhance this by adding descriptions for <leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })


        local statusline = function()
            local mini = require('mini.statusline')

            local mode, mode_hl = mini.section_mode({ trunc_width = 9999 })
            local git = mini.section_git({ trunc_width = 75 })
            local diagnostics = mini.section_diagnostics({ trunc_width = 75 })
            local filename = mini.section_filename({ trunc_width = 140 })
            local fileinfo = mini.section_fileinfo({ trunc_width = 9999 })
            local location = mini.section_location({ trunc_width = 9999 })
            -- local clock = " " .. os.date("%R")
            -- local battery = require("battery").get_status_line()

            return mini.combine_groups({
                { hl = mode_hl,                 strings = { mode } },
                { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
                "%<", -- truncate point
                { hl = "MiniStatuslineLocation", strings = { filename } },
                "%=", -- end left alignment
                { hl = "MiniStatuslineLocation", strings = { location } },
                { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                -- { hl = mode_hl,                  strings = { battery, clock } },
            })
        end

        -- [[ Mini Statusline ]]
        require('mini.statusline').setup(
        -- No need to copy this inside `setup()`. Will be used automatically.
            {
                -- Content of statusline as functions which return statusline string. See
                -- `:h statusline` and code of default contents (used instead of `nil`).
                content = {
                    -- Content for active window
                    active = statusline,
                    -- Content for inactive window(s)
                    inactive = nil,
                },

                -- Whether to use icons by default
                use_icons = true,

                -- Whether to set Vim's settings for statusline (make it always shown with
                -- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
                -- this to `false` and 'laststatus' to 3.
                set_vim_settings = true,
            })
    end,
    keys = {
        {
            "<leader>bd",
            function()
                local bd = require("mini.bufremove").delete
                if vim.bo.modified then
                    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                    if choice == 1 then -- Yes
                        vim.cmd.write()
                        bd(0)
                    elseif choice == 2 then -- No
                        bd(0, true)
                    end
                else
                    bd(0)
                end
            end,
            desc = "Delete Buffer",
        },
        -- stylua: ignore
        { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        { "<leader>e",  ":lua MiniFiles.open()<cr>",                              desc = "Show Files",           silent = true }
    },
}
