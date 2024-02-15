local Util = require "lazyvim.util"
local colors = require("tokyonight.colors").setup()

return {
  {
    "petertriho/nvim-scrollbar",
    opts = {
      handle = {
        color = "#6b728f",
      },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    },
    init = function()
      Util.on_load("gitsigns.nvim", function()
        require("scrollbar.handlers.gitsigns").setup()
      end)
    end,
  },
}
