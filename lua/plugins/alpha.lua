return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    lazy = true,
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
	                                              
	       ████ ██████           █████      ██
	      ███████████             █████ 
	      █████████ ███████████████████ ███   ███████████
	     █████████  ███    █████████████ █████ ██████████████
	    █████████ ██████████ █████████ █████ █████ ████ █████
	  ███████████ ███    ███ █████████ █████ █████ ████ █████
	 ██████  █████████████████████ ████ █████ █████ ████ ██████

    ]]

        local fortune = io.popen("fortune -s"):read("*a") -- Run the fortune command to get a random fortune

        dashboard.section.header.val = vim.split(logo .. fortune .. "\n", "\n")
        -- dashboard.section.header.val = vim.split(logo, "\n")
        -- stylua: ignore
        dashboard.section.buttons.val = {
            dashboard.button("p", " " .. " Projects", "<cmd>Telescope projects<cr>"),
            dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
            dashboard.button("o", " " .. " Open Folder",
                "<cmd> Telescope file_browser path=~/Documents/Development/ <cr>"),
            dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
            dashboard.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
            dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
            dashboard.button("c", " " .. " Config", "<cmd> Telescope file_browser path=~/.config/nvim <cr>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 8
        return dashboard
    end,

    config = function()
        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
};
