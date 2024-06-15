return {
  {
    "neovim/nvim-lspconfig",

    ---@type PluginLspOpts
    opts = {
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = false,
        underline = true,
      },

      -- Disable inlay hints by default, show it using <Leader>uh
      inlay_hints = { enabled = false },

      -- Enable codelens by default, might broke some lsp server that doesn't support it (e.g. json)
      -- HACK: we force enable this on init function
      codelens = { enabled = true },
    },
    init = function()
      -- HACK: fix noisy error: "method textDocument/codeLens is not supported by any of the servers registered for the current buffer"
      if vim.lsp.codelens then
        LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
          -- vim.lsp.codelens.refresh()
          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = function()
              -- add buffer number here (not in lazyvim)
              vim.lsp.codelens.refresh { bufnr = buffer }
            end,
          })
        end)
      end
      -- LazyVim.lsp.on_attach(function(client, buffer)
      --   if not client.supports_method "textDocument/codeLens" then
      --   end
      -- end)

      --
      -- Add custom keymaps
      --
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- stylua: ignore
      keys[#keys + 1] = {
        "gi",
        function() require("telescope.builtin").lsp_implementations { reuse_win = false, show_line = false } end,
        desc = "G To Implementations",
      }

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
