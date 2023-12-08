return {
  require "plugins.editor.neo-tree",
  require "plugins.editor.telescope",
  require "plugins.editor.which-key",
  require "plugins.editor.mini-misc",
  require "plugins.editor.mini-indentscope",
  require "plugins.editor.activity-watch",
  require "plugins.editor.markdown",
  -- TODO: move to proper file
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
      { "<leader>bP", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>b0", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
    },
  },
}
