return {
  "Pheon-Dev/pigeon",
  config = function()
    local config = {
      enabled = true,
      os = "osx", -- windows, osx
      plugin_manager = "lazy", -- packer, paq, vim-plug
      callbacks = {
        killing_pigeon = nil,
        respawning_pigeon = nil,
      },
      -- more config options here
    }

    require("pigeon").setup(config)
  end,
}
