return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension "media_files"
      end)
    end,
  },
}
