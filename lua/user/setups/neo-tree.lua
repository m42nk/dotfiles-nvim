local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
  return
end

require("user.utils.keymaps").nmap {
  ["<c-k>"] = { "<cmd>Neotree buffers float reveal toggle<cr>", "Neotree Buffers" },
  ["<leader>e"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
  ["<leader>B"] = {
    "<cmd>Neotree float toggle buffers<cr>",
    "Neotree Buffers",
  },
}

neo_tree.setup {
  use_popups_for_input = false,
  popup_border_style = "single",
  add_blank_line_at_top = false,
  -- close_floats_on_escape_key = true,
  enable_diagnostics = true,

  sources = { "filesystem", "buffers" },
  source_selector = {
    winbar = false,
    statusline = true,
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
      position = "float",
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
      },
    },
  },
  default_component_configs = {
    -- icon = {
    --   folder_closed = "",
    --   folder_open = "",
    -- },
    highlights = {
      hint = "DiagnosticSignHint",
      info = "DiagnosticSignInfo",
      warn = "DiagnosticSignWarn",
      error = "DiagnosticSignError",
    },
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
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
