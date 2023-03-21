local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  ensure_installed = require "user.treesitter.ensure_installed",
  playground = { enable = true },
  highlight = { enable = true },
  autotag = { enable = true },
  indent = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gts",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      },
    },
  },
}
