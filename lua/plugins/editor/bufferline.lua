return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
    keys = {
      { "<leader>br", false },
      { "<leader>bl", false },

      { "<leader>bL", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffer to the right" },
      { "<leader>bH", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffer to the left" },

      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>b0", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
      { "<leader>bS", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort buffer by directory" },

      { "<c-s-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<c-s-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
    },
  },
  {
    -- Scope buffers to tab
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup {}
    end,
  },
}
