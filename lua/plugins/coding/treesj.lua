return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      { "<leader>Cs", "<cmd>TSJToggle<cr>", desc = "Splitjoin: toggle" },
      { "<leader>Cj", "<cmd>TSJJoin<cr>", desc = "Splitjoin: join" },
    },
  },
}
