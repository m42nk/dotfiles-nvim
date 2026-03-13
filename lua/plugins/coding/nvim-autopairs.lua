---@type LazySpec
return {
  {
    "windwp/nvim-autopairs",
    -- version = "0.11.0",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      local npairs = require "nvim-autopairs"

      npairs.setup(opts)
      npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
    end,
  },
  {
    "nvim-mini/mini.pairs",
    enabled = false,
  },
}
