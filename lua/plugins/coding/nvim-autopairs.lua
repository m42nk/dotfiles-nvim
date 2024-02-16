---@type LazySpec
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      local npairs = require "nvim-autopairs"

      npairs.setup(opts)
      npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
    end,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
}
