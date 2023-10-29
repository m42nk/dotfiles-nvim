-- Install and setup package manager (lazy.nvim) and required programs.
require("user.utils.housekeeping").bootstrap()

-- Setup neovim configurations. e.g. options, commands, etc.
require("user.configs").setup()

-- Setup lazy.nvim and import all specs from lua/user/plugins
require("user.utils.plugin").setup()
