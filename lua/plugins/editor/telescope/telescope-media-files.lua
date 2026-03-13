return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    -- version = "" -- invalid versioning
    config = function()
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension "media_files"
      end)
    end,
  },
}
