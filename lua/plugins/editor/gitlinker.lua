return {
  -- {
  --   "ruifm/gitlinker.nvim",
  --   config = function()
  --     require("lazyvim.util").on_load("which-key.nvim", function()
  --       require("which-key").add {
  --         { "<leader>gl", desc = "Gitlinker", mode = { "n", "v" } },
  --       }
  --
  --       require("gitlinker").setup {}
  --     end)
  --   end,
  -- },
  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("lazyvim.util").on_load("which-key.nvim", function()
        require("which-key").add {
          { "<leader>gl", desc = "Gitlinker", mode = { "n", "v" } },
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
      {
        "<leader>gll",
        function()
          require("gitlinker").link {
            router_type = "browse",
            action = function(url)
              local buf_path = vim.api.nvim_buf_get_name(0)
              local buf_dir = vim.fn.fnamemodify(buf_path, ":p:h")
              local gitroot = require("gitlinker.git").get_root(buf_dir)
              local project = vim.fn.fnamemodify(gitroot, ":t")
              local filepathfromroot = project .. "/" .. buf_path:sub(#gitroot + 2)

              local markdown_link = string.format("[%s](%s)", filepathfromroot, url)

              vim.schedule(function()
                vim.api.nvim_command("let @+ = '" .. markdown_link .. "'")
                vim.notify("Copied markdown permalink to clipboard: " .. markdown_link, vim.log.levels.INFO)
              end)
            end,
          }
        end,
        mode = { "n", "v" },
        silent = true,
        noremap = true,
        desc = "Copy markdown permalink to clipboard",
      },
    },
  },
}
