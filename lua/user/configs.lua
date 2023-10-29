local M = {}


-- TODO: Find a way to load all modules in configs folder instead of importing
-- them one by one.
M.setup = function()
  require "user.configs.options"
  require "user.configs.abbrevs"
  require "user.configs.autocmds"
  require "user.configs.commands"
  require "user.configs.highlights"
  require "user.configs.keymaps"
  require "user.configs.lua-globals"

  -- Change colorscheme (builtin),
  -- so that we don't use the awful default colorscheme from vim
  vim.cmd.colorscheme("habamax")
end

return M
