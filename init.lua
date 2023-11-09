-- bootstrap lazy.nvim, LazyVim and your plugins
require "config.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "config.highlights"
    require "config.abbrevs"
  end,
})
