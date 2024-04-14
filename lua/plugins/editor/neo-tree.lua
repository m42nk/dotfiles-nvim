return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    popup_border_style = "single", -- "double", "none", "rounded", "shadow", "single" or "solid"
    window = {
      position = "float", -- left, right, top, bottom, float, current
      -- width = 40, -- applies to left and right positions
      -- height = 25, -- applies to top and bottom positions
      height = "50%", -- applies to top and bottom positions
      mappings = {
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
        ["H"] = { "navigate_up" },

        ["<c-h>"] = { "toggle_hidden" },

        ["L"] = "focus_preview",
        ["P"] = {
          function(state)
            if state.current_position == "bottom" then
              state.commands.toggle_preview(state)
              return
            end

            require("neo-tree.command").execute { action = "close" }
            require("neo-tree.command").execute { action = "focus", position = "bottom" }
          end,
          config = { use_float = true },
        },

        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.notify("Path copied to clipboard:\n" .. path, "info", { title = "NeoTree" })
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },

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
    buffers = {
      show_unloaded = true, -- When working with sessions, for example, restored but unfocused buffers
    },
    filesystem = {
      bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
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
          "application.yml",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle reveal=true position=float<cr>", desc = "Toggle NeoTree" },
    { "<leader>E", "<cmd>Neotree toggle reveal=true position=left<cr>", desc = "Toggle NeoTree (Left)" },
    { "<leader>fp", "<cmd>Neotree toggle action=show position=left<cr>", desc = "Toggle NeoTree (Left)" },
  },
}
