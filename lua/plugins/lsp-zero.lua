return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    lazy = false,
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" }
    },
    config = function()
        -- Auto formattting helper function
        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        local lsp_format_on_save = function(bufnr)
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                    filter = function(client)
                        return client.name == "null-ls"
                    end
                end,
            })
        end

        -- [[ Set up LSP-Zero ]]
        local lsp_zero = require('lsp-zero')
        lsp_zero.preset('recommended')
        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_format_on_save(bufnr)

            -- "Auto No Neck Pain"
            -- turn on NoNeckPain if the window size is too big
            local width = vim.fn.winwidth(0)
            -- Run NoNeckPain command if screen is larger than 27 inches
            if width > 300 and auto_neckpain then
                vim.cmd("NoNeckPain")
            end

            -- Keybindings
            vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- [[ Set up Keymaps ]]
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
            })
        })
    end
}
