---@type LazySpec
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    ---@type CopilotChat.config
    opts = {
      -- model = "claude-sonnet-4.5",
      model = "copilot:gpt-5-mini",
      temperature = 0.1,
      sticky = {
        "Provide concise answers.",
        "Provide follow-up questions to clarify user requests.",
        "#buffers",
      },
    },
  },
}

-- HACK: Rate limit / flag abuse resolution
--  check this issue on copilot-cmp https://github.com/zbirenbaum/copilot-cmp/issues/117
-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     build = ":Copilot auth",
--     opts = {
--       suggestion = { enabled = true },
--       panel = { enabled = true },
--       filetypes = {
--         markdown = true,
--         help = true,
--       },
--     },
--   },
--   {
--     "zbirenbaum/copilot-cmp",
--     enabled = false,
--   },
-- }

-- vim.g._copilot_enabled = true
--
-- return {
--   -- copilot
--   {
--     "zbirenbaum/copilot.lua",
--     opts = {
--       suggestion = { enabled = false, auto_trigger = false },
--       panel = { enabled = false },
--       filetypes = {
--         markdown = true,
--         help = true,
--         go = function()
--           local DEFAULT_ENABLED = false
--
--           local filepath = tostring(vim.fn.expand "%:p:h")
--           local homedir = tostring(vim.fn.expand "$HOME/Work")
--           if filepath:find(homedir, 1, true) == 1 then
--             return false
--           end
--
--           return DEFAULT_ENABLED
--         end,
--       },
--     },
--     keys = {
--       { "<leader>ua", "<cmd>Copilot suggestion toggle_auto_trigger<cr>", "Toggle copilot (auto trigger)" },
--       { "<leader>uA", "<cmd>Copilot toggle<cr>", "Toggle copilot" },
--     },
--   },
--   {
--     "nvim-lualine/lualine.nvim",
--     optional = true,
--     event = "VeryLazy",
--     opts = function(_, opts)
--       local Util = require "lazyvim.util"
--       local colors = {
--         [""] = Util.ui.fg "Special",
--         ["Normal"] = Util.ui.fg "Special",
--         ["Warning"] = Util.ui.fg "DiagnosticError",
--         ["InProgress"] = Util.ui.fg "DiagnosticWarn",
--       }
--       table.insert(opts.sections.lualine_x, 2, {
--         function()
--           local icon = require("lazyvim.config").icons.kinds.Copilot
--           local status = require("copilot.api").status.data
--           return icon .. (status.message or "")
--         end,
--         cond = function()
--           if not package.loaded["copilot"] then
--             return
--           end
--           local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
--           if not ok then
--             return false
--           end
--           return ok and #clients > 0
--         end,
--         color = function()
--           if not package.loaded["copilot"] then
--             return
--           end
--           local status = require("copilot.api").status.data
--           return colors[status.status] or colors[""]
--         end,
--       })
--     end,
--   },
--
--   -- copilot cmp source
--   {
--     "nvim-cmp",
--     dependencies = { {
--       "zbirenbaum/copilot-cmp",
--       enabled = false,
--     } },
--   },
-- }
