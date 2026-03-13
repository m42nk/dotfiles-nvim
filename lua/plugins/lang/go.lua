---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = { ensure_installed = { "go", "gomod", "gowork", "gosum" } },
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
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
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
      -- setup = {
      --   gopls = function(_, opts)
      --     -- workaround for gopls not supporting semanticTokensProvider
      --     -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
      --     Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
      --       if not client.server_capabilities.semanticTokensProvider then
      --         local semantic = client.config.capabilities.textDocument.semanticTokens
      --         client.server_capabilities.semanticTokensProvider = {
      --           full = true,
      --           legend = {
      --             tokenTypes = semantic.tokenTypes,
      --             tokenModifiers = semantic.tokenModifiers,
      --           },
      --           range = true,
      --         }
      --       end
      --     end)
      --     -- end workaround
      --   end,
      -- },
    },
  },
  -- Ensure Go tools are installed
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "goimports", "gofumpt" } },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "LazyFile",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "gomodifytags", "impl" } },
      },
    },
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
        end,
      },
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- log_level = vim.log.levels.DEBUG,
      -- .local/state/nvim/neotest.log

      adapters = {
        ["neotest-golang"] = {
          -- log_level = vim.log.levels.DEBUG,
          -- .local/state/nvim/neotest-golang.log

          -- Here we can set options for neotest-golang, e.g.
          -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          runner = "gotestsum",

          warn_test_name_dupes = false,
          dap_go_enabled = true, -- requires leoluz/nvim-dap-go
          -- testify_enabled = true,
          go_test_args = {
            "-v",
            "-race",
            "-count=1",
            "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
          },
        },
      },
    },
  },

  -- Filetype icons
  {
    "nvim-mini/mini.icons",
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },
}
