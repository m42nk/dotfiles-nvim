local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"
local Util = require "lazyvim.util"
local util = require "plugins.editor.telescope.utils"

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", false },
      { "<leader>sB", Util.telescope "builtin", desc = "Telescope Builtins" },
      { "<leader>sf", Util.telescope "files", desc = "Find Files (root dir)" },
      { "<c-p>", Util.telescope "files", desc = "Find Files (root dir)" },
      { "<leader>bs", Util.telescope "buffers", desc = "Buffers" },
      { "<leader>fc", Util.telescope.config_files(), desc = "LazyVim files" },
      { "<leader>fl", util.lazyvim_files(), desc = "LazyVim files" },
      { "<leader>fL", util.lazynvim_files(), desc = "lazy.nvim files" },
      { "<leader>fd", util.global_todo_files(), desc = "lazy.nvim files" },
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
