local util = require("plugins.editor.neo-tree.util")

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  init = util.init_fn,
  opts = {
    close_if_last_window = true,
    popup_border_style = "single", -- "double", "none", "rounded", "shadow", "single" or "solid"
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
      position = "float", -- left, right, top, bottom, float, current
      -- width = 40, -- applies to left and right positions
      height = "60%", -- applies to top and bottom positions

      ---@type nui_popup_options
      popup = {
        size = { width = "100%", height = "60%" },
        position = { col = "50%", row = "100%" },
        title = function(state) -- format the text that appears at the top of a popup window
          return state.name:gsub("^%l", string.upper)
        end,
      },

      mappings = {
        ["h"] = "close_node",
        ["l"] = "toggle_node",
        ["L"] = "focus_preview",
        ["H"] = util.shift_h,
        ["<c-h>"] = util.ctrl_h,
        ["E"] = util.shfit_e,
        ["P"] = util.shfit_p,
        ["Y"] = util.shift_y,

        -- Set to 'none' to remove neo-tree mapping and use vim's default
        ["<space>"] = "none",
        ["/"] = "none",
        ["f"] = "none",
        ["s"] = "none",
      },
    },
    filesystem = {
      bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
      hijack_netrw_behavior = "open_current",
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
        show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          --"node_modules",
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json"
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignore",
          ".env*",
          "application.yml",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          ".DS_Store",
          "thumbs.db",
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  },
  cmd = { "Neotree" },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle reveal=true position=float<cr>", desc = "Toggle NeoTree" },
    { "<leader>E", "<cmd>Neotree toggle reveal=true position=right<cr>", desc = "Toggle NeoTree (Left)" },
  },
}
