----------------------------------
-- Colorscheme
----------------------------------

local catpuccin = function()
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

  require("catppuccin").setup {
    transparent_background = true,
    term_colors = true,
    integration = {
      leap = true,
      neotree = {
        enabled = true,
        transparent_panel = true,
      },
    },
  }

  vim.cmd [[colorscheme catppuccin]]
end

catpuccin()
