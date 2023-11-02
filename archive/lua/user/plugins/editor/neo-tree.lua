return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    -- PERF: This event basically turn off lazy loading, disable if impacted too big.
    event = { "VimEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons",
      { "MunifTanjim/nui.nvim", lazy = true },
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      sources = { "filesystem", "buffers" },
      -- enable_normal_mode_for_inputs = true,
      -- use_popups_for_input = false,
      close_if_last_window = true,
      window = {
        mappings = {
          ["h"] = { "close_node" },
          ["l"] = { "toggle_node" },
          ["P"] = { "toggle_preview", config = { use_float = true } },
          -- Set to 'none' to fallback to the default mappings
          ["<Space>"] = "none",
        },
      },
      filesystem = {
        -- Need eager-load neotree to make this load
        hijack_netrw_behavior = "open_current",
        -- Auto Refresh
        use_libuv_file_watcher = true,
        filtered_items = { always_show = { ".gitignore", ".env*" } },
        follow_current_file = { enabled = true },
      },
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
  },
}
