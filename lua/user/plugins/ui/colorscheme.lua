return {
  {
    "folke/tokyonight.nvim",
    -- opts are placed in config since we need to call the setup first
    -- before setting the colorscheme
    -- opts = {},
    config = function()
      require("tokyonight").setup {
        style = "night",
        transparent = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},

          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
        -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        sidebars = { "qf", "help" },
        -- Enabling this option, will hide inactive statuslines and replace them
        -- with a thin border instead. Should work with the standard
        -- **StatusLine** and **LuaLine**.
        hide_inactive_statusline = false,
        -- dims inactive windows
        dim_inactive = false,
        -- When `true`, section headers in the lualine theme will be bold
        lualine_bold = false,
      }

      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
}
