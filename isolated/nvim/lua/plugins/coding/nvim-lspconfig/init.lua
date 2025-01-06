return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- ensure_installed for all extensions (mason-lspconfig, mason-nvim-dap, etc)
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Loader UI indicator for LSP
      { "j-hui/fidget.nvim", opts = {} },

      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- LSP Server configurations (refer to nvim-lspconfig or each LSP docs for available values)
      local servers = {
        lua_ls = {},
      }

      -- Additional LSP/tools to install
      local ensure_installed = vim.list_extend(vim.tbl_keys(servers or {}), {
        "stylua",
      })

      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      )

      require("plugins.coding.nvim-lspconfig.keymaps").setup_on_attach()

      require("mason").setup()
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
