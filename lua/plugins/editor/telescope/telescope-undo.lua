return {
  {
    "debugloop/telescope-undo.nvim",
    -- version = "" -- invalid versioning
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension "undo"
      end)
    end,
    keys = {
      { "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo history" },
    },
  },
}
