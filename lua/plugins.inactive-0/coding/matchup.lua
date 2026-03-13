---@type LazySpec
return {
  {
    "andymass/vim-matchup",
    -- version = "", -- no versioning
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
}
