local Util = require "lazyvim.util"
return {
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
  --       lsp_cfg = false,
  --     }
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", "gomod" },
  --   build = ':lua require("go.install").update_all_sync()',
  -- },

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

  -- {
  --   "nvim-neotest/neotest",
  --   opts = { adapters = { "neotest-plenary" } },
  --   dependencies = {
  --     { "nvim-neotest/neotest-go" },
  --     { "nvim-neotest/neotest-plenary" },
  --   },
  -- },
  --
  -- {
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   dependencies = {
  --     {
  --       "williamboman/mason.nvim",
  --       opts = function(_, opts)
  --         opts.ensure_installed = opts.ensure_installed or {}
  --         vim.list_extend(opts.ensure_installed, { "delve" })
  --       end,
  --     },
  --     {
  --       "leoluz/nvim-dap-go",
  --       config = true,
  --     },
  --   },
  -- },


  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       gopls = {
  --         keys = {
  --           -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
  --           { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
  --         },
  --         settings = {
  --           gopls = {
  --             gofumpt = true,
  --             codelenses = {
  --               gc_details = false,
  --               generate = true,
  --               regenerate_cgo = true,
  --               run_govulncheck = true,
  --               test = true,
  --               tidy = true,
  --               upgrade_dependency = true,
  --               vendor = true,
  --             },
  --             hints = {
  --               assignVariableTypes = false,
  --
  --               compositeLiteralFields = true,
  --               compositeLiteralTypes = true,
  --
  --               constantValues = true,
  --               rangeVariableTypes = true,
  --
  --               functionTypeParameters = true,
  --               parameterNames = true,
  --             },
  --             analyses = {
  --               fieldalignment = false, -- "struct with yyyy pointer bytes could be xxx"
  --               unusedwrite = false, -- "could remove embedded field 'xxx' from selector"
  --               nilness = true,
  --               unusedparams = true,
  --               useany = true,
  --             },
  --             usePlaceholders = true,
  --             completeUnimported = true,
  --             staticcheck = true,
  --             directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
  --             semanticTokens = true,
  --           },
  --         },
  --       },
  --     },
  --     setup = {
  --       gopls = function(_, opts)
  --         -- workaround for gopls not supporting semanticTokensProvider
  --         -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
  --         require("lazyvim.util").lsp.on_attach(function(client, _)
  --           if client.name == "gopls" then
  --             if not client.server_capabilities.semanticTokensProvider then
  --               local semantic = client.config.capabilities.textDocument.semanticTokens
  --               client.server_capabilities.semanticTokensProvider = {
  --                 full = true,
  --                 legend = {
  --                   tokenTypes = semantic.tokenTypes,
  --                   tokenModifiers = semantic.tokenModifiers,
  --                 },
  --                 range = true,
  --               }
  --             end
  --           end
  --         end)
  --         -- end workaround
  --       end,
  --     },
  --   },
  -- },
}
