return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = opts.sources or {}

      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.formatting.goimports,
        nls.builtins.formatting.gofumpt,
        nls.builtins.code_actions.gomodifytags,
      })
    end,
  },
}
