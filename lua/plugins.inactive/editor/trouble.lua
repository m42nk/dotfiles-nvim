return {
  {
    "folke/trouble.nvim",
    opts = {
      ---@type table<string, trouble.Mode>
      modes = {
        custom = {
          mode = "lsp_references",
          focus = true,
          win = { position = "right" },
          filter = function(items)
            -- vim.fn.writefile(vim.fn.json_encode(items), "/tmp/trouble-items", "b")


            return items
          end,
        },
      },
    },
  },
}
