-- Load configurations
require "user.options"
require "user.plugins"
require "user.keymaps"
require "user.lsp"
require "user.completions"

-- Plugin configuration (setup)
local setup = require("user.lib.setup_loader_generator")("user.setups")

setup "which-key"
setup "telescope"
setup "neo-tree"

vim.cmd [[ colorscheme habamax ]]
