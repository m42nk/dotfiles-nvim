-- bootstrap lazy.nvim, LazyVim and your plugins
require "config.lazy"

local augroup = require("util.augroup").augroup
local custom = augroup "Custom"
vim.api.nvim_create_autocmd("User", {
  group = custom,
  pattern = "VeryLazy",
  callback = function()
    require "config.highlights"
    require "config.abbrevs"
  end,
})
