return {
  {
    "folke/tokyonight.nvim",
    -- opts are placed in config since we need to call the setup first
    -- before setting the colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = "night",
      transparent = true,
    },
    init = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
}
