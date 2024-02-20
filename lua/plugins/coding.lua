return {
  -- Treesitter
  require "plugins.coding.treesitter",

  -- Jump to any character in the file
  require "plugins.coding.flash",

  -- Completion
  require "plugins.coding.nvim-cmp",

  -- Convert oneliner to multiline, vice versa
  require "plugins.coding.treesj",

  -- Better LSP symbols
  require "plugins.coding.aerial",

  -- Better golang
  require "plugins.coding.golang",

  -- Attach non-lsp as lsp
  require "plugins.coding.none-ls",

  -- Refactoring tools using treesitter (inline variable, extract function, etc.)
  require "plugins.coding.refactoring-nvim",

  -- Preserve text case when renaming, changing from snake_case to camelCase, etc.
  require "plugins.coding.abolish",

  -- Copilot
  require "plugins.coding.copilot",

  -- LSP config
  require "plugins.coding.lspconfig",

  -- LSP UI improvement (peek definition, hover, etc.)
  require "plugins.coding.lspsaga",

  -- Better % jump (jump between matching brackets, etc.)
  require "plugins.coding.matchup",

  -- Better auto pairs (auto close brackets, quotes, etc.)
  require "plugins.coding.nvim-autopairs",

  -- Add text object (quotes, arguments, etc.)
  require "plugins.coding.targets",

  -- Animate scrolling
  -- require "plugins.coding.neoscroll",
}
