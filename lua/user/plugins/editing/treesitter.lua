local toggle_ts_fold = function()
  -- TODO: how to check foldexpr from metatable
  if vim.opt.foldexpr == "nvim_treesitter#foldexpr()" then
    vim.opt.foldmethod = "manual"
    vim.opt.foldexpr = 0
  else
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "LazyFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- Luckily, the only thins that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require "nvim-treesitter.query_predicates"
    end,
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end

      require("nvim-treesitter.configs").setup(opts)

      -- Setup folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false

      vim.keymap.set(
        "n",
        "<leader>tf",
        toggle_ts_fold,
        { desc = "Toggle treesitter folding" }
      )
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["ac"] = "@comment.outer",
            ["ic"] = "@comment.inner",
            ["aC"] = "@call.outer",
            ["iC"] = "@call.inner",
            ["ar"] = "@return.outer",
            ["ir"] = "@return.inner",
          },
        },
      },
    },
  },
}
