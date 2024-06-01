return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
    },
  },
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require "fluoromachine"

      fm.setup {
        transparent = true,
        -- brightness = 0.5,
        -- glow = true,
        -- fluoromachine, retrowave, delta
        theme = "retrowave",
        overrides = function(c)
          return {
            ["@type"] = { italic = true, bold = false },
            ["@function"] = { italic = false, bold = false },
            ["@comment"] = { italic = true },
            -- ["@keyword"] = { italic = false, underdashed = true },
            -- ["@function.method.call"] = { underline = true, fg="orange" },
            -- ["@property"] = { italic = false, fg="red" },
            ["Comment"] = { fg = "gray" },
            ["@keyword"] = { italic = false },
            ["@constant"] = { italic = false, bold = false },
            ["@variable"] = { italic = true },
            ["@field"] = { italic = true },
            ["@parameter"] = { italic = true },
            ["@string"] = { italic = false, fg = "lightgreen" },
            ["@keyword.return"] = { bold = true },

            ["@function.call"] = { underdashed = true, fg = "orange" },

            DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
            DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
            DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
            DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics
          }
        end,
        colors = function(_, d)
          return {
            red = "#ed64c6",
          }
        end,
      }

      -- vim.cmd.colorscheme "fluoromachine" -- set in lazyvim config
    end,
  },
}
