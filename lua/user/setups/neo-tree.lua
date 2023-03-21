local ok, neotree = pcall(require, "neo-tree")
if not ok then
  return
end
require("user.lib.keymap").nmap {
  ["<c-h>"] = { "<cmd>Neotree buffers float reveal toggle<cr>", "Neotree Buffers" },
  ["<leader>e"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
  ["<leader>B"] = {
    "<cmd>Neotree float toggle buffers<cr>",
    "Neotree Buffers",
  },
}

neotree.setup {
  use_popups_for_input = false,
  add_blank_line_at_top = false,

  sources = { "filesystem", "buffers" },
  source_selector = {
    winbar = false,
    statusline = false,
    content_layout = "center",
  },

  window = {
    popup = {
      size = {
        width = "100%",
        height = "60%",
      },
      position = {
        col = "100%",
        row = "100%",
      },
    },
    mappings = {
      ["<Esc>"] = function()
        vim.cmd "Neotree close"
      end,
      ["h"] = { "close_node" },
      ["l"] = { "toggle_node" },
    },
  },
  buffers = {
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    window = {
      mappings = {
        ["<C-l>"] = { "clear_filter" },
        ["<C-h>"] = { "toggle_hidden" },
        ["H"] = { "navigate_up" },
        ["f"] = { "fuzzy_finder" },
        ["F"] = { "fuzzy_finder" },
        -- use vim default
        ["/"] = {},
        -- use leap
        ["s"] = {},
        -- use leap
        ["S"] = {},
        -- noop
        ["w"] = function()
        end,
        -- noop
        ["b"] = function()
        end,
      },
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd [[ setlocal relativenumber ]]
      end,
    },
  },
}
