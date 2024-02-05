return {
  {
    "neovim/nvim-lspconfig",
    -- opts = {
    --   inlay_hints = { enabled = true },
    -- },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- stylua: ignore
      keys[#keys + 1] = {
        "gi",
        function() require("telescope.builtin").lsp_implementations { reuse_win = false } end,
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
        function() require("telescope.builtin").lsp_definitions({ reuse_win = false }) end,
        desc = "Goto Definition",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "<leader>cgd",
        function() require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" }) end,
        desc = "Goto Definition (Split)",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = false }) end, desc = "Goto T[y]pe Definition" }

      -- stylua: ignore
      keys[#keys + 1] = { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" }

      -- stylua: ignore
      keys[#keys + 1] = { "gx", vim.lsp.buf.declaration, desc = "Goto Declaration" }

      -- Unbind
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }
    end,
  },
}
