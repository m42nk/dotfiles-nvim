return {
  -- TODO: look at this lua alternative https://github.com/johmsalas/text-case.nvim
  {
    "tpope/vim-abolish",
  },
  {
    "markonm/traces.vim",
    enabled = false,
    init = function()
      vim.g.traces_abolish_integration = 1
    end,
  },
}
