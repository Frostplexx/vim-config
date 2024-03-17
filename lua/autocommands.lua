-- [[ Autocommands ]]
local function au(group, ...)
    local groupid = vim.api.nvim_create_augroup(group, {})
    for _, autocmd in ipairs({ ... }) do
        autocmd[2].group = groupid
        vim.api.nvim_create_autocmd(unpack(autocmd))
    end
end


au('YankHighlight', {
    'TextYankPost',
    {
        desc = 'Highlight the selection on yank.',
        callback = function()
            vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
        end,
    },
})

vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    group = "misc_group",
    pattern = '*',
    command = 'silent! normal! g`"zv'
})


-- render markdown in a terminal buffer
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('markdown_glow', { clear = true }),
    pattern = { 'markdown' },
    callback = function()
        vim.keymap.set(
            'n',
            '<leader>oo',
            "<cmd>execute 'terminal glow ' . expand('%') <bar> execute 'setlocal nomodifiable'<cr>",
            { buffer = true, desc = 'Open with Glow' }
        )
    end,
})
