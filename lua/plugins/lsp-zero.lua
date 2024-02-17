return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    lazy = true,
    event = "BufRead",
    dependencies = {
        { 'neovim/nvim-lspconfig',             lazy = true, event = "BufRead" }, -- LSP client
        {
            'hrsh7th/nvim-cmp',                                                  -- Autocompletion
            lazy = true,
            event = "InsertEnter",
            dependencies = {

                {
                    'saadparwaiz1/cmp_luasnip', -- Support for LuaSnip
                    lazy = true,
                    event = "InsertEnter"
                },
                {
                    'hrsh7th/cmp-nvim-lsp', --  Support for LSP
                    lazy = true,
                    event = "InsertEnter"
                },
            },
        },
        {
            'L3MON4D3/LuaSnip',
            lazy = true,
            event = "InsertEnter",
            dependencies = { "rafamadriz/friendly-snippets", lazy = true, event = "InsertEnter" } -- Collection of snippets
        },                                                                                        -- Snippet engine
        {
            "williamboman/mason.nvim",
            config = function()
                require('mason').setup({
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        },
                        border = "rounded",
                    }
                })
            end,
            lazy = true
        },                                                                                       -- Install LSP servers
        { "williamboman/mason-lspconfig.nvim", lazy = true },                                    -- connect mason to lspconfig
        { "j-hui/fidget.nvim",                 lazy = true, event = "BufRead", enabled = true }, -- LSP UI
    },


    config = function()
        require("fidget").setup {
            notification = {
                window = {
                    winblend = 0, -- Background opacity
                },
            }
        }
        -- Auto formattting helper function
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        local lsp_format_on_save = function(bufnr)
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                    Filter = function(client)
                        return client.name == "null-ls"
                    end
                end,
            })
        end

        -- [[ Set up LSP-Zero ]]
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset('recommended')
        lsp_zero.set_sign_icons({
            error = ' ',
            warn = ' ',
            hint = ' ',
            info = ' '
        })


        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_format_on_save(bufnr)

            -- Keybindings
            local opts = {}
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- [[ Set up LSP ]]
        local lspconfig = require('lspconfig')
        -- Bordered window
        require("lspconfig.ui.windows").default_options.border = "rounded"

        -- sourcekit-lsp
        lspconfig.sourcekit.setup {}

        -- lua_ls
        lspconfig.lua_ls.setup {
            settings = {
                -- removes the globals vim warning
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }

        -- [[ Set up Autocomplete ]]
        require('luasnip.loaders.from_vscode').lazy_load()
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            window = {
                -- This adds a border round autocompletion cmp
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            },
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),


                -- Super Tab
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            }),
        })
    end
}
