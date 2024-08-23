---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@param opts TSConfig
    config = function(_, opts)
      opts = vim.tbl_extend("force", opts, {
        autotag = { enable = true },
        matchup = { enable = true },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
          },
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-treesitter/playground" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- TODO: broken in LazyVim 12.38.2, see if we need to fix this or use default
    -- config = function()
    --   require("lazyvim.util").on_load("which-key.nvim", function()
    --     local i = {
    --       [" "] = "Whitespace",
    --       ['"'] = 'Balanced "',
    --       ["'"] = "Balanced '",
    --       ["`"] = "Balanced `",
    --       ["("] = "Balanced (",
    --       [")"] = "Balanced ) including white-space",
    --       [">"] = "Balanced > including white-space",
    --       ["<lt>"] = "Balanced <",
    --       ["]"] = "Balanced ] including white-space",
    --       ["["] = "Balanced [",
    --       ["}"] = "Balanced } including white-space",
    --       ["{"] = "Balanced {",
    --       ["?"] = "User Prompt",
    --       _ = "Underscore",
    --       a = "Argument",
    --       b = "Balanced ), ], }",
    --       c = "Class",
    --       f = "Function",
    --       o = "Block, conditional, loop",
    --       q = "Quote `, \", '",
    --       t = "Tag",
    --     }
    --     local a = vim.deepcopy(i)
    --     for k, v in pairs(a) do
    --       ---@diagnostic disable-next-line: param-type-mismatch
    --       a[k] = v:gsub(" including.*", "")
    --     end
    --
    --     local ic = vim.deepcopy(i)
    --     local ac = vim.deepcopy(a)
    --     for key, name in pairs { n = "Next", l = "Last" } do
    --       i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    --       a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    --     end
    --     require("which-key").register {
    --       mode = { "o", "x" },
    --       i = i,
    --       a = a,
    --     }
    --   end)
    -- end,
  },

  -- Use treesitter text-objects instead
  {
    "echasnovski/mini.ai",
    enabled = false,
    -- opts = function(_, opts)
    --   local ai = require "mini.ai"
    --
    --   -- Get defaults from LazyVim
    --   opts.custom_textobjects = vim.tbl_deep_extend("force", opts.custom_textobjects, {
    --     -- Assignments
    --     s = ai.gen_spec.treesitter({
    --       a = "@assignment.lhs",
    --       i = "@assignment.rhs",
    --     }, {}),
    --
    --     -- Conditionals
    --     c = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }, {}),
    --
    --     -- Whole buffer (vig/vag)
    --     g = function()
    --       local from = { line = 1, col = 1 }
    --       local to = {
    --         line = vim.fn.line "$",
    --         col = math.max(vim.fn.getline("$"):len(), 1),
    --       }
    --       return { from = from, to = to }
    --     end,
    --   })
    -- end,
    -- init = function()
    --   local Util = require "lazyvim.util"
    --
    --   Util.on_load("which-key.nvim", function()
    --     local i = {
    --       s = "Assignment",
    --       c = "Conditional",
    --       g = "Buffer",
    --     }
    --     local a = vim.deepcopy(i)
    --     for k, v in pairs(a) do
    --       a[k] = v:gsub(" including.*", "")
    --     end
    --
    --     local ic = vim.deepcopy(i)
    --     local ac = vim.deepcopy(a)
    --     for key, name in pairs { n = "Next", l = "Last" } do
    --       i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
    --       a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    --     end
    --     require("which-key").register {
    --       mode = { "o", "x" },
    --       i = i,
    --       a = a,
    --     }
    --   end)
    -- end,
  },
}
