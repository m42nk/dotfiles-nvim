local cmp = require "cmp"
local utils = require "plugins.coding.nvim-cmp.utils"

---@type LazySpec
return {
  {
    "hrsh7th/nvim-cmp",
    -- version = "~v0.0.2", -- too old
    -- init = function()
    --   Util.lsp.on_attach(function()
    --     -- local opts = { border = "rounded" }
    --     local opts = cmp.config.window.bordered()
    --     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, opts)
    --   end)
    -- end,
    --
    -- opts = function(_, opts)
    --   opts.servers["gopls"] = vim.tbl_deep_extend("force", opts.servers["gopls"] or {}, {
    --     settings = {
    --       gopls = {
    --         gofumpt = false,
    --         analyses = {
    --           ST1000 = false,
    --         },
    --       },
    --     },
    --   })
    --
    --   -- opts.servers["gopls"].settings.gopls.gofumpt = false
    --
    --   return opts
    -- end,
    opts = function(_, opts)
      local cmp = require "cmp"

      -- Add Minuet without replacing existing sources.
      opts.sources = opts.sources or {}
      -- table.insert(opts.sources, 1, { name = "minuet" })

      opts.preselect = cmp.PreselectMode.None

      opts.completion = {
        completeopt = "menu,menuone,preview,noinsert,noselect",
      }

      opts.performance = vim.tbl_deep_extend("force", opts.performance or {}, {
        fetching_timeout = 2000,
      })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      -- Merge mappings instead of replacing LazyVim's mappings.
      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<C-f>"] = require("minuet").make_cmp_map(),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),

        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),

        -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },

        ["<CR>"] = cmp.mapping(utils.handle_cr, { "i" }),
        ["<Tab>"] = cmp.mapping(utils.handle_tab, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(utils.handle_s_tab, { "i", "s" }),
      })
    end,
  },
}
