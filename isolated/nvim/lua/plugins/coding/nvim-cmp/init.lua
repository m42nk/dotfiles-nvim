local utils = require("plugins.coding.nvim-cmp.utils")

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {},
      },
      "saadparwaiz1/cmp_luasnip",

      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      local defaults = require("cmp.config.default")()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        mapping = {
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
          ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
          ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),

          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),

          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),

          ["<C-l>"] = cmp.mapping(utils.key_ctrl_l, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(utils.key_ctrl_h, { "i", "s" }),
          ["<CR>"] = cmp.mapping(utils.key_enter, { "i" }),
          ["<Tab>"] = cmp.mapping(utils.key_tab, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(utils.key_shift_tab, { "i", "s" }),
        },

        sources = {
          { name = "lazydev", group_index = 0 },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },

        -- sources = cmp.config.sources({
        --   { name = "lazydev" },
        --   { name = "nvim_lsp" },
        --   { name = "luasnip" },
        --   { name = "path" },
        -- }, {
        --   { name = "buffer" },
        -- }),

        formatting = {
          format = utils.formatting_format,
        },

        experimental = { ghost_text = { hl_group = "CmpGhostText" } },
        sorting = defaults.sorting,
      })
    end,
  },
}

--   vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--   local cmp = require("cmp")
--   local defaults = require("cmp.config.default")()
--   local auto_select = true
--   return {
--     auto_brackets = {}, -- configure any filetype to auto add brackets
--     completion = {
--       completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--     },
--     preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
--     mapping = cmp.mapping.preset.insert({
--       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--       ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--       ["<C-Space>"] = cmp.mapping.complete(),
--       ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
--       ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
--       ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--       ["<C-CR>"] = function(fallback)
--         cmp.abort()
--         fallback()
--       end,
--       ["<tab>"] = function(fallback)
--         return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
--       end,
--     }),
--     sources = cmp.config.sources({
--       { name = "lazydev" },
--       { name = "nvim_lsp" },
--       { name = "path" },
--     }, {
--       { name = "buffer" },
--     }),
--     formatting = {
--       format = function(entry, item)
--         local icons = LazyVim.config.icons.kinds
--         if icons[item.kind] then
--           item.kind = icons[item.kind] .. item.kind
--         end
--
--         local widths = {
--           abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
--           menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
--         }
--
--         for key, width in pairs(widths) do
--           if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
--             item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
--           end
--         end
--
--         return item
--       end,
--     },
--     experimental = {
--       -- only show ghost text when we show ai completions
--       ghost_text = vim.g.ai_cmp and {
--         hl_group = "CmpGhostText",
--       } or false,
--     },
--     sorting = defaults.sorting,
--   }
-- end,
