return {
  {
    "crusj/bookmarks.nvim",
    keys = {
      { "<leader>b<tab>", mode = { "n" } },
      { "\\z", mode = { "n" } },
    },
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    config = function()
      require("bookmarks").setup {
        storage_dir = "", -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
        mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
        keymap = {
          -- toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
          toggle = "<leader>b<tab>", -- Toggle bookmarks(global keymap)
          add = "\\z", -- Add bookmarks(global keymap)
          jump = "<CR>", -- Jump from bookmarks(buf keymap)
          delete = "dd", -- Delete bookmarks(buf keymap)
          order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
          delete_on_virt = "\\dd", -- Delete bookmark at virt text line(global keymap)
          show_desc = "\\sd", -- show bookmark desc(global keymap)
          focus_tags = "<c-j>", -- focus tags window
          focus_bookmarks = "<c-k>", -- focus bookmarks window
          toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
        },
        width = 0.8, -- Bookmarks window width:  (0, 1]
        height = 0.7, -- Bookmarks window height: (0, 1]
        preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
        tags_ratio = 0.1, -- Bookmarks tags window ratio
        fix_enable = true, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.
      }
      require("telescope").load_extension "bookmarks"
    end,
  },
}
