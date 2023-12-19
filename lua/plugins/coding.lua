return {
  require "plugins.coding.nvim-cmp",
  require "plugins.coding.treesj",
  require "plugins.coding.aerial",
  require "plugins.coding.mini-ai",
  require "plugins.coding.golang",
  require "plugins.coding.none-ls",
  require "plugins.coding.refactoring-nvim",
  require "plugins.coding.abolish",
  require "plugins.coding.copilot",
  -- TODO: move to proper file
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = {
        "gi",
        function()
          require("telescope.builtin").lsp_implementations { reuse_win = true }
        end,
        desc = "G To Implementations",
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {}
    end,
  },
}
