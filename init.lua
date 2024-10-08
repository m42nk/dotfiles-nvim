-- bootstrap lazy.nvim, LazyVim and your plugins
require "config.lazy"

-- Patch to avoid "Buffer x is newer than edits"
require "config.lsp_textedit_patch"

-- Load additional config beside the one provided by LazyVim
-- This will run on the "VeryLazy" event
vim.api.nvim_create_autocmd("User", {
  group = require("util.augroup").augroup "Custom",
  pattern = "VeryLazy",
  callback = function()
    require "config.highlights"
    require "config.abbrevs"
    require "config.commands"
  end,
})
