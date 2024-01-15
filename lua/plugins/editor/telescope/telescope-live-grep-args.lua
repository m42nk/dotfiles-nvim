local Util = require "lazyvim.util"

return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
    config = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension "live_grep_args"
      end)
    end,
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    --   opts = {
    --     extensions = {
    --       live_grep_args = {
    --         auto_quoting = true, -- enable/disable auto-quoting
    --         -- define mappings, e.g.
    --         mappings = { -- extend mappings
    --           i = {
    --             ["<C-S-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
    --             ["<C-S-i>"] = require("telescope-live-grep-args.actions").quote_prompt { postfix = " --iglob " },
    --           },
    --         },
    --         -- ... also accepts theme settings, for example:
    --         -- theme = "dropdown", -- use dropdown theme
    --         -- theme = { }, -- use own theme spec
    --         -- layout_config = { mirror=true }, -- mirror preview pane
    --       },
    --     },
    --   },
    -- },
    keys = {
      {
        "<leader>fg",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        desc = "Live Grep with rg Args",
      },
      {
        "<leader>sG",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
        desc = "Live Grep with rg Args",
      },
      {
        "<leader>sw",
        "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>",
        desc = "Live Grep Args - Word under cursor",
      },
      {
        "<leader>sv",
        "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<cr>",
        desc = "Live Grep Args - Visual Selection",
        mode="v"
      },
    },
  },
}
