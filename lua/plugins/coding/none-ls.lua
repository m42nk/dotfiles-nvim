return {
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require "null-ls"
      opts.sources = opts.sources or {}

      opts.sources = vim.tbl_extend("force", opts.sources, {
        -- GOLANG

        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,

        nls.builtins.formatting.goimports,
        nls.builtins.diagnostics.golangci_lint,
        -- nls.builtins.diagnostics.staticcheck,
        -- nls.builtins.formatting.gofumpt,

        -- Other
        nls.builtins.formatting.sql_formatter,
        nls.builtins.diagnostics.codespell,
        nls.builtins.code_actions.refactoring,

        -- require("go.null_ls").golangci_lint(),
        -- require("go.null_ls").gotest(),
        -- require("go.null_ls").gotest_action(),
      })

      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.code_actions.refactoring,
      })

      opts.sources = vim.tbl_extend("force", opts.sources, {
        nls.builtins.code_actions.gitsigns,
      })
    end,
  },
}
