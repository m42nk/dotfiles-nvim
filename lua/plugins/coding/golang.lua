local Util = require "lazyvim.util"
return {
  {
    "ray-x/go.nvim",
    enabled = true,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        disable_defaults = true,
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  {
    "edolphin-ydf/goimpl.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension "goimpl"
      end)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- NOTE: notice that this config is on top level,
      -- for codelense and inlay_hints, lazyvim already handle this with proper
      -- checking (enabling globally here will make other lsp that doesn't support fails)
      --
      -- diagnostics = { update_in_insert = false },
      -- inlay_hints = { enabled = false },
      -- codelens = { enabled = true },

      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                generate = true,
                gc_details = false,
                regenerate_cgo = false,
                run_govulncheck = false,
                test = false,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = false,

                compositeLiteralFields = true,
                compositeLiteralTypes = true,

                constantValues = true,
                rangeVariableTypes = true,

                functionTypeParameters = true,
                parameterNames = true,
              },
              analyses = {
                fieldalignment = false, -- "struct with yyyy pointer bytes could be xxx"
                nilness = true,

                unusedwrite = false, -- "could remove embedded field 'xxx' from selector"
                unusedparams = true,
                unusedvariable = true,

                useany = true,
                shadow = true,
              },

              usePlaceholders = false, -- placeholders enables placeholders for function parameters or struct fields in completion responses.
              completeUnimported = true,

              -- TODO: use golangci-lint instead of gopls for ease of configuration
              staticcheck = false,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = false, -- Enabling this makes sql syntax highlight (injection) not working
            },
          },
        },
      },
    },
  },
}
