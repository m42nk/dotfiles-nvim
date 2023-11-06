local cmp = require "cmp"
local utils = require "plugins.coding.nvim-cmp.utils"

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      preselect = cmp.PreselectMode.None,
      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },
      -- TODO: popupmenu still uses cmp, try explore nui via noice
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
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
