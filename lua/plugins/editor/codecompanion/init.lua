---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      "franco-ruggeri/codecompanion-spinner.nvim",
    },
    opts = {
      -- -- NOTE: The log_level is in `opts.opts`
      -- opts = {
      --   log_level = "DEBUG", -- or "TRACE"
      -- },
      extensions = {
        spinner = {},
      },

    },
    init = function()
      -- require("plugins.editor.codecompanion.fidget-spinner"):init()
    end,
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat <cr>", desc = "Code Companion Chat", mode = { "n", "v" } },
    },
  },
}
