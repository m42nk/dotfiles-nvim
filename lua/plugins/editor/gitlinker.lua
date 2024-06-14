return {
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("lazyvim.util").on_load("which-key.nvim", function()
        require("which-key").register {
          mode = { "n", "v" },
          ["<leader>gl"] = { name = "Gitlinker" },
        }
      end)

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
          current_branch = {
            ["source%.golabs%.io"] = "https://source.golabs.io/"
              .. "{_A.ORG}/"
              .. "{_A.REPO}/blob/"
              .. "{_A.CURRENT_BRANCH}/"
              .. "{_A.FILE}"
              .. "#L{_A.LSTART}"
              .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
          },
          default_branch = {
            ["source%.golabs%.io"] = "https://source.golabs.io/"
              .. "{_A.ORG}/"
              .. "{_A.REPO}/blob/"
              .. "{_A.DEFAULT_BRANCH}/"
              .. "{_A.FILE}"
              .. "#L{_A.LSTART}"
              .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
          },
        },
      }
    end,
    keys = {
      {
        "<leader>gld",
        "<cmd>GitLink default_branch<cr>",
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        desc = "Copy git permalink (default branch) to clipboard",
      },
      {
        "<leader>glb",
        "<cmd>GitLink current_branch<cr>",
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        desc = "Copy git permalink (current branch) to clipboard",
      },
      -- use blob
      {
        "<leader>gls",
        "<cmd>GitLink<cr>",
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        desc = "Copy git permalink (blob) to clipboard",
      },
    },
  },
}
