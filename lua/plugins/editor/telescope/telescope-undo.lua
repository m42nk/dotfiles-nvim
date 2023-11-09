local Util = require "lazyvim.util"

return {
  {
    "debugloop/telescope-undo.nvim",
    config = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension "undo"
      end)
    end,
    keys = {
      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo history" },
    },
  },
}
