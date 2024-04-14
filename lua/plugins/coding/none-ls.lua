return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = opts.sources or {}

      -- GOLANG
      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,

        nls.builtins.diagnostics.golangci_lint,
        -- nls.builtins.diagnostics.staticcheck,

        nls.builtins.formatting.goimports,
        -- nls.builtins.formatting.gofumpt,

        -- require("go.null_ls").golangci_lint(),
        -- require("go.null_ls").gotest(),
        -- require("go.null_ls").gotest_action(),
      })

      -- Other
      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.refactoring,

        nls.builtins.diagnostics.codespell,

        nls.builtins.formatting.sql_formatter,
      })
    end,
  },
}
