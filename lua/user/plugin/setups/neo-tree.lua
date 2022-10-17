local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
  return
end

require("user.utils.keymaps").nmap {
  ["<leader>e"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
  ["<leader>B"] = {
    "<cmd>Neotree float toggle buffers<cr>",
    "Neotree Buffers",
  },
}

neo_tree.setup {
  use_popups_for_input = false,
  popup_border_style = "rounded",
  add_blank_line_at_top = false,

  sources = { "filesystem", "buffers" },
  source_selector = {
    winbar = true,
    statusline = true,
    content_layout = "center",
  },
  window = {
    popup = {
      size = { width = "80%" },
    },
  },
  buffers = {
    window = {
      mappings = {
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
      },
    },
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    window = {
      mappings = {
        ["<C-l>"] = { "clear_filter" },
        ["<C-h>"] = { "toggle_hidden" },
        ["h"] = { "close_node" },
        ["l"] = { "toggle_node" },
        ["H"] = { "navigate_up" },
        ["f"] = { "fuzzy_finder" },
        ["F"] = { "fuzzy_finder" },
        ["/"] = { --[[ use vim default / ]]
        },
        ["s"] = { --[[ use leap ]]
        },
        ["S"] = { --[[ use leap ]]
        },
        ["w"] = function() --[[noop]]
        end,
        ["b"] = function() --[[noop]]
        end,
        ["<Esc>"] = function()
          vim.cmd "Neotree toggle"
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
      handler = function(arg)
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    },
  },
}

vim.cmd [[
let g:neo_tree_remove_legacy_commands = 1
]]
