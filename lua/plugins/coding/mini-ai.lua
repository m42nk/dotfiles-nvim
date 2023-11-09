return {
  {
    "echasnovski/mini.ai",
    opts = function(_, opts)
      local ai = require "mini.ai"

      -- Get defaults from LazyVim
      opts.custom_textobjects = vim.tbl_deep_extend("force", opts.custom_textobjects, {
        -- Assignments
        s = ai.gen_spec.treesitter({
          a = "@assignment.lhs",
          i = "@assignment.rhs",
        }, {}),

        -- Conditionals
        c = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }, {}),

        -- Whole buffer (vig/vag)
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line "$",
            col = math.max(vim.fn.getline("$"):len(), 1),
          }
          return { from = from, to = to }
        end,
      })
    end,
    init = function()
      local Util = require "lazyvim.util"

      Util.on_load("which-key.nvim", function()
        local i = {
          s = "Assignment",
          c = "Conditional",
          g = "Buffer",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs { n = "Next", l = "Last" } do
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register {
          mode = { "o", "x" },
          i = i,
          a = a,
        }
      end)
    end,
  },
}
