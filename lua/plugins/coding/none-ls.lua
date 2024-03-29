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
        nls.builtins.code_actions.impl,
        -- nls.builtins.diagnostics.revive,
        nls.builtins.diagnostics.golangci_lint,

        nls.builtins.diagnostics.codespell,

        -- require("go.null_ls").golangci_lint(),
        -- require("go.null_ls").gotest(),
        require("go.null_ls").gotest_action(),
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
