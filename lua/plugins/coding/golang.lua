---@type LazySpec
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
        go = "go",
        preludes = {
          default = function()
            return {}
          end,
          GoRun = function()
            return {}
          end,
        },
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     -- opts.servers["gopls"] = vim.tbl_deep_extend("force", opts.servers["gopls"] or {}, {
  --     --   settings = {
  --     --     gopls = {
  --     --       gofumpt = false,
  --     --     },
  --     --   },
  --     -- })
  --
  --     -- opts.servers["gopls"].settings.gopls.gofumpt = false
  --
  --     return opts
  --   end,
  -- },

  -- {
  --   "ray-x/go.nvim",
  --   enabled = true,
  --   dependencies = {
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup {
  --       disable_defaults = true,
  --     }
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },
  --
  -- {
  --   "edolphin-ydf/goimpl.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-lua/popup.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     LazyVim.on_load("telescope.nvim", function()
  --       require("telescope").load_extension "goimpl"
  --     end)
  --   end,
  -- },
  --
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "fredrikaverpil/neotest-golang",
  --   },
  --   opts = function(_, opts)
  --     opts.adapters["neotest-go"] = nil
  --     local neotest_go = require "neotest-golang"
  --     opts.adapters = vim.tbl_deep_extend("keep", opts.adapters, {
  --       neotest_go {
  --         go_test_args = {
  --           "-v",
  --           "-race",
  --           "-count=1",
  --           "-timeout=60s",
  --           "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
  --         },
  --         dap_go_enabled = true,
  --       },
  --     })
  --
  --     return opts
  --   end,
  -- },
  --
  -- {
  --   -- use neotest-golang instead of neotest-go
  --   "nvim-neotest/neotest-go",
  --   enabled = false,
  -- },
  --
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts)
  --     -- pick what's needed from below, empty for now since we want to follow defaults from lazyvim
  --
  --     opts.servers["gopls"] = vim.tbl_deep_extend("force", opts.servers["gopls"] or {}, {
  --       settings = {
  --         gopls = {
  --           analyses = {
  --             fieldalignment = false, -- "struct with yyyy pointer bytes could be xxx"
  --           },
  --
  --           semanticTokens = false, -- Enabling this makes sql syntax highlight (injection) not working
  --         },
  --       },
  --     })
  --
  --     return opts
  --   end,
  -- },
  --
  -- -- {
  -- --   "neovim/nvim-lspconfig",
  -- --   opts = {
  -- --     servers = {
  -- --       gopls = {
  -- --         settings = {
  -- --           gopls = {
  -- --             gofumpt = true,
  -- --             codelenses = {
  -- --               generate = true,
  -- --               gc_details = false,
  -- --               regenerate_cgo = false,
  -- --               run_govulncheck = false,
  -- --               test = false,
  -- --               tidy = true,
  -- --               upgrade_dependency = true,
  -- --               vendor = true,
  -- --             },
  -- --             hints = {
  -- --               assignVariableTypes = false,
  -- --
  -- --               compositeLiteralFields = true,
  -- --               compositeLiteralTypes = true,
  -- --
  -- --               constantValues = true,
  -- --               rangeVariableTypes = true,
  -- --
  -- --               functionTypeParameters = true,
  -- --               parameterNames = true,
  -- --             },
  -- --             analyses = {
  -- --               fieldalignment = false, -- "struct with yyyy pointer bytes could be xxx"
  -- --               nilness = true,
  -- --
  -- --               unusedwrite = false, -- "could remove embedded field 'xxx' from selector"
  -- --               unusedparams = true,
  -- --               unusedvariable = true,
  -- --
  -- --               useany = true,
  -- --               shadow = true,
  -- --             },
  -- --
  -- --             usePlaceholders = false, -- placeholders enables placeholders for function parameters or struct fields in completion responses.
  -- --             completeUnimported = true,
  -- --
  -- --             -- TODO: use golangci-lint instead of gopls for ease of configuration
  -- --             staticcheck = false,
  -- --             directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
  -- --             semanticTokens = false, -- Enabling this makes sql syntax highlight (injection) not working
  -- --           },
  -- --         },
  -- --       },
  -- --     },
  -- --   },
  -- -- },
}
