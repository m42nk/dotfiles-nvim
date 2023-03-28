local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local c = require("user.lib.lualine-components")

lualine.setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    refresh = {
      statusline = 1000,
    },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
  winbar = {
    lualine_c = { c.ft_icon, c.relative_pathname },
  },
  inactive_winbar = {
    lualine_c = { c.ft_icon_nocolor, c.relative_pathname },
  },
  sections = {
    lualine_a = {
      c.mode,
    },
    lualine_b = {},
    lualine_c = {
      c.branch,
      c.python_env,
      c.diff,
    },
    lualine_x = {
      c.diagnostics,
      c.treesitter,
      c.fileformat,
      c.filetype,
      c.location,
    },
    lualine_y = {
      c.buf_count,
    },
    lualine_z = {},
  }
}