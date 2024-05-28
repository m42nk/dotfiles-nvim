return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- options for vim.diagnostic.config()
      ---@type vim.diagnostic.Opts
      diagnostics = {
        virtual_text = false,
        severity_sort = true,
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
      keys[#keys + 1] = { "gr", function() require("telescope.builtin").lsp_references({ reuse_win = false, show_line = false, include_current_line = false, }) end, desc = "References" }

      -- stylua: ignore
      keys[#keys + 1] = { "gx", vim.lsp.buf.declaration, desc = "Goto Declaration" }

      -- Unbind
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }
    end,
  },
}
