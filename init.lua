-- bootstrap lazy.nvim, LazyVim and your plugins
require "config.lazy"
require "config.neovide"

-- Patch to avoid "Buffer x is newer than edits"
require "config.lsp_textedit_patch"

-- Load additional config beside the one provided by LazyVim
-- This will run on the "VeryLazy" event
local augroup = require("util.augroup").augroup
local custom = augroup "Custom"
vim.api.nvim_create_autocmd("User", {
  group = custom,
  pattern = "VeryLazy",
  callback = function()
    require "config.highlights"
    require "config.abbrevs"
    require "config.commands"
  end,
})

