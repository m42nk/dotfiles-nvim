local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"
local util = require "lazyvim.util"

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "<leader>sf", util.telescope "files", desc = "Find Files (root dir)" },
      { "<leader>bs", util.telescope "buffers", desc = "Buffers" },
      { "<c-p>", util.telescope "files", desc = "Find Files (root dir)" },
    },
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "bottom_pane",
        winblend = 0,
        layout_config = {
          bottom_pane = {
            preview_cutoff = 0,
            height = 0.625,
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
          n = {
            ["<tab>"] = actions.move_selection_next,
            ["<s-tab>"] = actions.move_selection_previous,

            ["<m-p>"] = layout.toggle_preview,

            ["<c-n>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<c-p>"] = actions.toggle_selection + actions.move_selection_better,
          },
          i = {
            ["<tab>"] = actions.move_selection_next,
            ["<s-tab>"] = actions.move_selection_previous,

            ["<m-p>"] = layout.toggle_preview,

            ["<c-n>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<c-p>"] = actions.toggle_selection + actions.move_selection_better,
          },
        },
      },
      pickers = {
        git_files = {
          prompt_title = "Find Files (Git)",
        },
        find_files = {
          prompt_title = "Find Files",
        },
        buffers = {
          prompt_title = "Buffers",
          mappings = {
            i = {
              ["<c-l>"] = actions.delete_buffer,
            },
            n = {
              ["<c-l>"] = actions.delete_buffer,
            },
          },
        },
      },
    },
  },
}
