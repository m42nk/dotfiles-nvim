----------------------------------
-- Colorscheme
----------------------------------

local tokyodark = function()
  vim.g.tokyodark_transparent_background = false
  vim.g.tokyodark_enable_italic_comment = true
  vim.g.tokyodark_enable_italic = true
  vim.g.tokyodark_color_gamma = "1.0"

  local colorscheme = "tokyodark"

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    return
  end
end

local catpuccin = function()
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

  require("catppuccin").setup {
    transparent_background = true,
    term_colors = true,
    integration = {
      leap = true,
      nvimtree = {
        enabled = false,
      },
      neotree = {
        enabled = true,
        transparent_panel = true,
      },
    },
  }

  vim.cmd [[colorscheme catppuccin]]
end

catpuccin()
