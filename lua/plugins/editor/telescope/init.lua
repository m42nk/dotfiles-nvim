local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"
local Util = require "lazyvim.util"
local tsUtil = require "plugins.editor.telescope.utils"

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- { "<c-p>", Util.telescope "files", desc = "Find Files (root dir)" },
      -- stylua: ignore
      { "<c-p>", tsUtil.find_files(), desc = "Find Files (root dir)", },
      { "<leader>/", false },
      { "<leader><space>", false },
      { "<leader>bs", Util.telescope "buffers", desc = "Buffers" },
      { "<leader>fL", tsUtil.lazyvim_tree(), desc = "LazyVim files (Neo-tree)" },
      { "<leader>fc", Util.telescope.config_files(), desc = "LazyVim files" },
      { "<leader>fd", tsUtil.global_todo_files(), desc = "Find global TODO files" },
      { "<leader>fl", tsUtil.lazyvim_files(), desc = "LazyVim files (Telescope)" },
      { "<leader>sg", tsUtil.live_grep(), desc = "Grep (Root Dir)" },
      { "<leader>sB", Util.telescope "builtin", desc = "Telescope Builtins" },
      { "<leader>sf", Util.telescope "files", desc = "Find Files (root dir)" },
      { "<leader>sj", Util.telescope("jumplist", { trim_text = true }), desc = "Telescope Jumps" },
      { "<leader>sv", Util.telescope "git_status", desc = "Git Status" },
      { "<leader>z", Util.telescope "spell_suggest", desc = "Suggest Spelling" },
    },
    dependencies = {
      require "plugins.editor.telescope.telescope-undo",
      require "plugins.editor.telescope.telescope-live-grep-args",
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

            -- ignore shortcuts for lsp pickers
            ["<c-h>"] = { " !mock !test ", type = "command" },

            -- putting it on 'extensions' not working
            ["<C-s-h>"] = function(prompt_bufnr)
              -- stylua: ignore
              require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob !*mock* --iglob !*test* " })(prompt_bufnr)
            end,

            -- refine
            ["<c-f>"] = actions.to_fuzzy_refine,
          },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
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
