return {
  {
    "L3MON4D3/LuaSnip",
    -- Disables tab mapping from lazyvim
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function() return "<tab>" end,
        expr = true, silent = true, mode = {"i", "s"},
      },
      {
        "<s-tab>",
        function() return "<tab>" end,
        expr = true, silent = true, mode = {"i", "s"},
      },
    },
  },
}
