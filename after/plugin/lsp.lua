-- Disable Auto Neckpain
local auto_neckpain = true
-- ----------------------

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function()
    local width = vim.fn.winwidth(0)
    -- Run NoNeckPain command if screen is larger than 27 inches
    if width > 300 and auto_neckpain then
      vim.cmd("NoNeckPain")
    end
  end,
})
