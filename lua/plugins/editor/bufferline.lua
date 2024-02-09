return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>br", false},

      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Move buffer next" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Move buffer next" },

      { "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
      { "<leader>bP", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>b0", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
      { "<leader>bS", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort buffer by directory" },
      { "<c-s-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<c-s-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
    },
  },
}
