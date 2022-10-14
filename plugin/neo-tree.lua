local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
  return
end

-- TODO: force cwd on neo-tree but not on telescope
-- TODO: probably not force, but provide easier way
-- TODO: probably add binding to insert full path like in :Neotree dir=...

-- nmap("<leader>e", "<cmd>Neotree float reveal toggle<CR>", "Neotree")
-- nmap("<leader>E", "<cmd>Neotree float reveal_force_cwd<CR>", "Neotree force cwd")

require("user.utils.keymaps").nmap {
  ["<leader>e"] = { "<cmd>Neotree float reveal toggle<cr>", "Neotree" },
}

neo_tree.setup {
  use_popups_for_input = false,
  popup_border_style = "rounded",
  add_blank_line_at_top = false,

  sources = { "filesystem" },
  source_selector = {
    winbar = false,
    statusline = true,
    content_layout = "center",
  },
  window = {
    popup = {
      size = { width = "80%" },
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
        -- ["s"] = { --[[ use leap ]]
        -- },
        -- ["S"] = { --[[ use leap ]]
        -- },
        ["w"] = function() --[[noop]]
        end,
        ["b"] = function() --[[noop]]
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
