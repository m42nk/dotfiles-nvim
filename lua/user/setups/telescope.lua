local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local builtin = require('telescope.builtin')
local action_layout = require "telescope.actions.layout"
local actions = require "telescope.actions"

telescope.load_extension "fzy_native"

telescope.setup {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    results_title = "",
    winblend = 0,
    layout_config = {
      bottom_pane = {
        preview_cutoff = 0,
      },

      vertical = {
        prompt_position = "top",
      },
    },

    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },

    mappings = {
      i = {
        ["<c-l>"] = actions.delete_buffer,
        ["<tab>"] = actions.move_selection_next,
        ["<s-tab>"] = actions.move_selection_previous,

        ["<c-h>"] = actions.toggle_selection,
        ["<c-j>"] = action_layout.toggle_preview,

        ["kj"] = "close",
      },
    },
  },
  pickers = {
    buffers = {
      prompt_title = "Buffers",
      preview_title = "",
      previewer = false,
      sort_mru = true,
      sort_lastused = true,
      -- path_display = { shorten = 2 },
      path_display = { "smart" },
      dynamic_preview_title = true,
      mappings = {
        i = {
          -- ["<c-l>"] = "noop",
        },
      },
    },
    find_files = {
      find_command = {
        "fd",
        "--hidden",
        "--type",
        "f",
        "--exclude",
        "node_modules",
        "--exclude",
        ".git",
        "--exclude",
        "_build",
      },
      previewer = false,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

require("user.lib.keymap").map {
  ["<c-p>"] = { builtin.find_files, "Find files" },
  ["<c-n>"] = { builtin.buffers, "Show buffer list" },
  ["<leader>t"] = {
    name = "Telescope",
    ["!"] = { builtin.command_history, "Command history" },
    ["P"] = { builtin.projects, "Projects" },
    ["b"] = { builtin.buffers, "Buffers" },
    ["h"] = { builtin.help_tags, "Help pages" },
    ["j"] = { builtin.jumplist, "Jumplist" },
    ["l"] = { builtin.live_grep, "Search text" },
    ["m"] = { builtin.man_pages, "Man pages" },
    ["o"] = { builtin.oldfiles, "Command history" },
    ["r"] = { builtin.resume, "Resume" },
    ["t"] = { builtin.builtin, "List actions" },
    ["w"] = { builtin.lsp_dynamic_workspace_symbols, "List workspace symbol" },
    ["d"] = { builtin.lsp_document_symbols, "List document symbol" },
  },
}

