return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    popup_border_style = "single", -- "double", "none", "rounded", "shadow", "single" or "solid"
    window = {
      position = "float", -- left, right, top, bottom, float, current
      -- width = 40, -- applies to left and right positions
      -- height = 25, -- applies to top and bottom positions
      mappings = {
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
        ["H"] = { "navigate_up" },
        ["<c-h>"] = { "toggle_hidden" },
        ["P"] = { "toggle_preview", config = { use_float = true } },
        -- Set to 'none' to fallback to the default mappings
        ["<space>"] = "none",
        ["<esc>"] = { "close_window" },
      },
      popup = {
        size = {
          width = "100%",
          height = "60%",
        },
        position = {
          col = "50%",
          row = "100%",
        },
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
    { "<leader>e", "<cmd>Neotree toggle reveal=true position=float<cr>", desc = "Toggle NeoTree" },
    { "<leader>fp", "<cmd>Neotree toggle action=show position=left<cr>", desc = "Toggle NeoTree" },
  },
}
