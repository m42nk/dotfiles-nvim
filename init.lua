-- Load configurations
require "user.options"
require "user.plugins"
require "user.keymaps"
require "user.lsp"
require "user.completions"

-- Plugin configuration (setup)
local setup = require("user.lib.setup-loader-generator")("user.setups")

setup "which-key"
setup "telescope"
setup "neo-tree"
setup "lualine"
setup "gitsigns"
setup "treesitter"
setup "tokyonight"

vim.cmd [[ colorscheme tokyonight-night ]]
