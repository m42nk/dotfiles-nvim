local cmp = require "cmp"
local utils = require "plugins.coding.nvim-cmp.utils"
local Util = require "lazyvim.util"

return {
  {
    "hrsh7th/nvim-cmp",
    -- init = function()
    --   Util.lsp.on_attach(function()
    --     -- local opts = { border = "rounded" }
    --     local opts = cmp.config.window.bordered()
    --     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, opts)
    --   end)
    -- end,
    opts = {
      preselect = cmp.PreselectMode.None,
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      window = {
        completion = cmp.config.window.bordered(),
        -- NOTE: this is the documentation while hovering over cmp item (in popup)
        -- this still get applied correctly.
        documentation = cmp.config.window.bordered(),
      },
      -- mapping = cmp.mapping.preset.insert {
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),

        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),

        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },

        ["<CR>"] = utils.handle_cr,
        ["<Tab>"] = cmp.mapping(utils.handle_tab, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(utils.handle_s_tab, { "i", "s" }),
      },
    },
  },
}
