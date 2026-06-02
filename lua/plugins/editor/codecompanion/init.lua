---@type LazySpec
return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      "franco-ruggeri/codecompanion-spinner.nvim",
      "ravitemer/codecompanion-history.nvim",
    },
    opts = {
      -- -- NOTE: The log_level is in `opts.opts`
      -- opts = {
      --   log_level = "DEBUG", -- or "TRACE"
      -- },
      extensions = {
        spinner = {},
        history = {
          enabled = true,
        },
      },

      interactions = {
        chat = {
          opts = {
            ["read_file"] = {
              opts = { require_approval_before = false },
            },
            ["grep_search"] = {
              opts = { require_approval_before = false },
            },
            ["get_diagnostics"] = {
              opts = { require_approval_before = false },
            },
            ["file_search"] = {
              opts = { require_approval_before = false },
            },
            ["get_changed_files"] = {
              opts = { require_approval_before = false },
            },
            ---        ---@class CodeCompanion.SystemPrompt.Context
            ---        ---@field language string
            ---        ---@field adapter CodeCompanion.HTTPAdapter|CodeCompanion.ACPAdapter
            ---        ---@field date string
            ---        ---@field nvim_version string
            ---        ---@field os string the operating system that the user is using
            ---        ---@field default_system_prompt string
            ---        ---@field cwd string current working directory
            ---        ---The closest parent directory that contains one of the following VCS markers:
            ---        --- - `.git`
            ---        --- - `.svn`
            ---        --- - `.hg`
            ---        ---@field project_root? string the closest parent directory that contains a `.git` subdirectory.
            ---        system_prompt = function(ctx)
            ---          return ctx.default_system_prompt
            ---            .. string.format(
            ---              [[Additional context:
            ---    Provide concise answers.
            ---    Provide follow-up questions to clarify user requests.
            ---]],
            ---              ctx.language,
            ---              ctx.date,
            ---              ctx.nvim_version,
            ---              ctx.os
            ---            )
            ---        end,
          },
          adapter = {
            name = "copilot",
            model = "claude-haiku-4.5",
          },
          tools = {
            opts = {
              default_tools = {
                "files",
                "agent",
                -- "create_file",
                -- "delete_file",
                "fetch_webpage",
                "file_search",
                "get_changed_files",
                "get_diagnostics",
                "grep_search",
                "read_file",
                -- "run_command",
                -- "web_search",
              },
            },
          },
        },
      },
    },
    init = function()
      -- require("plugins.editor.codecompanion.fidget-spinner"):init()
    end,
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat <cr>", desc = "Code Companion Chat", mode = { "n", "v" } },
    },
  },
}
