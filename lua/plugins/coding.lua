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
      keys[#keys + 1] = {
        "gI",
        function() require("telescope.builtin").lsp_implementations({ jump_type = "vsplit" }) end,
        desc = "Goto Implementation",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "gd",
        function() require("telescope.builtin").lsp_definitions({ reuse_win = false }) end,
        desc = "Goto Definition",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "gD",
        function() require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" }) end,
        desc = "Goto Definition (Split)",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" }

      -- stylua: ignore
      keys[#keys + 1] = { "gx", vim.lsp.buf.declaration, desc = "Goto Declaration" }
      -- stylua: ignore
      keys[#keys + 1] = { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = false }) end, desc = "Goto T[y]pe Definition" }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup {
        easing_function = "cubic",
      }
    end,
    init = function()
      local Util = require "lazyvim.util"
      Util.on_load("which-key.nvim", function()
        local t = {}
        -- Syntax: t[keys] = {function, {function arguments}}
        -- Use the "sine" easing function
        t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "350", [['sine']] } }
        t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "350", [['sine']] } }
        -- Use the "circular" easing function
        t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } }
        t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "500", [['circular']] } }
        -- Pass "nil" to disable the easing animation (constant scrolling speed)
        t["<C-y>"] = { "scroll", { "-0.10", "false", "100", nil } }
        t["<C-e>"] = { "scroll", { "0.10", "false", "100", nil } }
        -- When no easing function is provided the default easing function (in this case "quadratic") will be used
        t["zt"] = { "zt", { "300" } }
        t["zz"] = { "zz", { "300" } }
        t["zb"] = { "zb", { "300" } }

        require("neoscroll.config").set_mappings(t)
      end)
    end,
  },
}
