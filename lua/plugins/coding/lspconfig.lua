return {
  {
    "neovim/nvim-lspconfig",

    ---@param opts PluginLspOpts
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = false,
        underline = true,
      },

      -- Disable inlay hints by default, show it using <Leader>uh
      inlay_hints = { enabled = false },

      ---@type lspconfig.options
      ---@diagnostic disable-next-line: missing-fields
      servers = {
        ---@diagnostic disable-next-line: missing-fields
        vtsls = {
          -- NOTE: we tinkered with this since diagnostic is duplicated from tsserver & eslint
          -- we resolved it by hiding diagnostic virtual text and use undercurl instead
          -- handlers = {
          --   ---@param err lsp.ResponseError
          --   ---@param ctx lsp.HandlerContext
          --   ---@param result lsp.PublishDiagnosticsParams
          --   ---@param config vim.diagnostic.Opts
          --   ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          --     if ctx ~= nil and ctx.params ~= nil and ctx.params.diagnostics ~= nil then
          --       local idx = 1
          --       while idx <= #ctx.params.diagnostics do
          --         if ctx.params.diagnostics[idx].code == 80001 then
          --           table.remove(ctx.params.diagnostics, idx)
          --         else
          --           idx = idx + 1
          --         end
          --       end
          --     end
          --
          --     ---@type vim.diagnostic.Opts
          --     local override_config = {}
          --
          --     override_config = vim.tbl_deep_extend("force", config or {}, override_config)
          --
          --     ---@diagnostic disable-next-line: redundant-return-value
          --     return vim.lsp.with(vim.lsp.diagnostics.on_publish_diagnostics, override_config)
          --   end,
          -- },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- stylua: ignore
      keys[#keys + 1] = {
        "gi",
        function() require("telescope.builtin").lsp_implementations { reuse_win = false, show_line = false } end,
        desc = "G To Implementations",
      }

      -- stylua: ignore
      -- keys[#keys + 1] = {
      --   "gI",
      --   function() require("telescope.builtin").lsp_implementations({ jump_type = "vsplit" }) end,
      --   desc = "Goto Implementation",
      -- }

      -- stylua: ignore
      keys[#keys + 1] = {
        "gd",
        function() require("telescope.builtin").lsp_definitions({ reuse_win = false, show_line = false }) end,
        desc = "Goto Definition",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "<leader>cgd",
        function() require("telescope.builtin").lsp_definitions({ jump_type = "vsplit", show_line = false }) end,
        desc = "Goto Definition (Split)",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = false }) end, desc = "Goto T[y]pe Definition" }

      -- stylua: ignore
      keys[#keys + 1] = { "gr", function() require("telescope.builtin").lsp_references({ reuse_win = false, show_line = false, include_current_line = false }) end, desc = "References" }

      -- stylua: ignore
      keys[#keys + 1] = { "gx", vim.lsp.buf.declaration, desc = "Goto Declaration" }

      -- Unbind
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }
    end,
  },
}
