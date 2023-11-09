local Util = require "lazyvim.util"

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require "lualine_require"
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      -- NOTE: components need to be imported here to wait for hlgroup to be loaded
      local C = require "plugins.ui.lualine.components"

      return {
        options = {
          theme = "auto",
          globalstatus = false,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          refresh = {
            statusline = 1000,
          },
        },
        sections = {
          lualine_a = { C.mode },
          lualine_b = { "branch" },
          lualine_c = {
            Util.lualine.root_dir(),
            C.diagnostics,
            C.filetype,
            Util.lualine.pretty_path(),
          },
          lualine_x = {
            C.statusline_command,
            C.statusline_mode,
            C.dap,
            C.plugin_updates,
            C.diff,
            C.treesitter_status,
            C.copilot,
          },
          lualine_y = {
            C.python_env,
            C.location,
          },
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
