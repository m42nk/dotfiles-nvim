local k = require "user.utils.keymaps"

vim.cmd [[
  iabbrev reuqire require
  iabbrev rqr     require

  iabbrev inor    if not ok then return end
]]

k.nmap("<leader>r", "<cmd>R<cr>", "Reload current file")
