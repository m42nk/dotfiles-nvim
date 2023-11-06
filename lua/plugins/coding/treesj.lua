return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      { "<leader>cs", "<cmd>TSJToggle<cr>", "Splitjoin: toggle" },
      { "<leader>cj", "<cmd>TSJJoin<cr>", "Splitjoin: join" },
    },
  },
}
