-- Install and setup package manager (lazy.nvim) and required programs.
require("user.utils.housekeeping").bootstrap()

-- Setup neovim configurations. e.g. options, commands, etc.
require("user.configs").setup()

-- Add custom events
require("user.utils.event-lazyfile").lazy_file()

-- Setup lazy.nvim and import all specs from lua/user/plugins
require("user.utils.plugin").setup()

local x = 20

if x > 20 and x < 10 then
  vim.print("heloo")
end

function a()
  -- heloj
  print("geming")
end
