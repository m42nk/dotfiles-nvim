local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local c = require "user.lualine.components"

lualine.setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    refresh = {
      statusline = 500,
    },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
  sections = {
    lualine_a = {
      c.mode,
    },
    lualine_b = {
      c.branch,
    },
    lualine_c = {
      c.python_env,
      c.filename,
      c.diff,
    },
    lualine_x = {
      c.diagnostics,
      c.treesitter,
      c.lsp,
      c.filetype,
      c.encoding,
    },
    lualine_y = {
      c.location,
    },
    lualine_z = {},
  },
}
