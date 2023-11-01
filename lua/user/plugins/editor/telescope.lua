local util = require "user.utils"
local pluginUtils = require "user.utils.plugin"
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    enabled = pluginUtils.has_executables({ "rg" }, "telescope.nvim"),
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable "make" == 1,
        config = function()
          util.on_load("telescope.nvim", function()
            require("telescope").load_extension "fzf"
          end)
        end,
      },
    },
    keys = {
      -- TODO: incomplete
      { "<c-p>", "<cmd>Telescope find_files<cr>", "Find files" },
    },
  },
}
