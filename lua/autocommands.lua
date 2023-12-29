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
