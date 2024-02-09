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
      Util.on_load("telescope", function()
        require("telescope").load_extension "goimpl"
      end)
    end,
    keys = {
      { "<leader>im", "<cmd>lua require'telescope'.extensions.goimpl.goimpl()<CR>", "Goimpl" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
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
                unusedwrite = false, -- "could remove embedded field 'xxx' from selector"
                nilness = true,
                unusedparams = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },

  -- {
  --   "nvim-neotest/neotest",
  --   optional = true,
  --   dependencies = {
  --     "nvim-neotest/neotest-go",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-go"] = {
  --         -- Here we can set options for neotest-go, e.g.
  --         -- args = { "-tags=integration" }
  --         experimental = {
  --           test_table = true,
  --         },
  --       },
  --     },
  --   },
  -- },
}
