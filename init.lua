-- [[ init file ]]

-- [[ lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- initalize lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        lazy = true,
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "catppuccin" } },
    checker = { enabled = false }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})

-- disable copilot
-- vim.g.copilot = false
-- vim.cmd("Copilot disable")
