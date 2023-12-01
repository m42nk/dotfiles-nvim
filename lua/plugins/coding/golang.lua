local Util = require "lazyvim.util"
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
        lsp_cfg = false,
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
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
}
