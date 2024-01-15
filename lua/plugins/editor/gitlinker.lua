return {
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup {
        router = {
          browse = {
            ["source%.golabs%.io"] = "https://source.golabs.io/"
              .. "{_A.ORG}/"
              .. "{_A.REPO}/blob/"
              .. "{_A.REV}/"
              .. "{_A.FILE}"
              .. "#L{_A.LSTART}"
              .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
          },
        },
      }
    end,
    keys = {
      {
        "<leader>gl",
        "<cmd>GitLink<cr>",
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        desc = "Copy git permlink to clipboard",
      },
    },
  },
}
