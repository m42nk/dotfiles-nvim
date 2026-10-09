return {
  {
    "nvim-telescope/telescope.nvim",
    -- version = "~v0.2.1",
    keys = {
      -- stylua: ignore
      { "<c-p>", function() require("plugins.editor.telescope.utils").find_files() end, desc = "Find Files (root dir)" },
      { "<leader>/", false },
      { "<leader><space>", false },
      { "<leader>bs", LazyVim.pick "buffers", desc = "Buffers" },
      {
        "<leader>fL",
        function()
          require("plugins.editor.telescope.utils").lazyvim_tree()
        end,
        desc = "LazyVim files (Neo-tree)",
      },
      { "<leader>fc", LazyVim.pick.config_files(), desc = "LazyVim files" },
      {
        "<leader>fd",
        function()
          require("plugins.editor.telescope.utils").global_todo_files()
        end,
        desc = "Find global TODO files",
      },
      {
        "<leader>fl",
        function()
          require("plugins.editor.telescope.utils").lazyvim_files()
        end,
        desc = "LazyVim files (Telescope)",
      },
      {
        "<leader>sG",
        function()
          require("plugins.editor.telescope.utils").live_grep()
        end,
        desc = "Grep (Root Dir)",
      },
      { "<leader>sB", LazyVim.pick "builtin", desc = "Telescope Builtins" },
      { "<leader>sR", LazyVim.pick "resume", desc = "Telescope Resume" },
      { "<leader>sf", LazyVim.pick "files", desc = "Find Files (root dir)" },
      { "<leader>sj", LazyVim.pick("jumplist", { trim_text = true }), desc = "Telescope Jumps" },
      { "<leader>sv", LazyVim.pick "git_status", desc = "Git Status" },
      { "<leader>z", LazyVim.pick "spell_suggest", desc = "Suggest Spelling" },
    },
    dependencies = {
      require "plugins.editor.telescope.telescope-undo",
      require "plugins.editor.telescope.telescope-live-grep-args",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          LazyVim.on_load("telescope.nvim", function()
            require("telescope").load_extension "fzf"
          end)
        end,
      },
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
            ["<tab>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,

            ["<s-tab>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,

            ["<m-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end,

            ["<c-n>"] = function(prompt_bufnr)
              local actions = require "telescope.actions"
              actions.toggle_selection(prompt_bufnr)
              actions.move_selection_worse(prompt_bufnr)
            end,

            ["<c-p>"] = function(prompt_bufnr)
              local actions = require "telescope.actions"
              actions.toggle_selection(prompt_bufnr)
              actions.move_selection_better(prompt_bufnr)
            end,
          },

          i = {
            ["<tab>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,

            ["<s-tab>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,

            ["<m-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end,

            ["<c-n>"] = function(prompt_bufnr)
              local actions = require "telescope.actions"
              actions.toggle_selection(prompt_bufnr)
              actions.move_selection_worse(prompt_bufnr)
            end,

            ["<c-p>"] = function(prompt_bufnr)
              local actions = require "telescope.actions"
              actions.toggle_selection(prompt_bufnr)
              actions.move_selection_better(prompt_bufnr)
            end,

            -- ignore shortcuts for lsp pickers
            ["<c-h>"] = { " !mock !_test.go ", type = "command" },

            -- putting it on 'extensions' not working
            ["<C-s-h>"] = function(prompt_bufnr)
              require("telescope-live-grep-args.actions").quote_prompt {
                postfix = " -g !*mock* -g !*_test.go -g !*vendor*",
              }(prompt_bufnr)
            end,
            ["<M-C-H>"] = function(prompt_bufnr)
              require("telescope-live-grep-args.actions").quote_prompt {
                postfix = " -g !*mock* -g !*_test.go -g !*vendor*",
              }(prompt_bufnr)
            end,

            -- refine
            ["<c-f>"] = function(...)
              return require("telescope.actions").to_fuzzy_refine(...)
            end,
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
              ["<c-l>"] = function(...)
                return require("telescope.actions").delete_buffer(...)
              end,
            },
            n = {
              ["<c-l>"] = function(...)
                return require("telescope.actions").delete_buffer(...)
              end,
            },
          },
        },
      },
    },
  },
}
