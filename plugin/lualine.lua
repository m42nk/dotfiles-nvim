local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local lsp_status_ok, lsp_status = pcall(require, "lsp-status")
if lsp_status_ok then
  lsp_status.register_progress()
end

local diff_section = {
  "diff",
  symbols = {
    added = "[+] ",
    modified = "[~] ",
    removed = "[-] ",
  },
  source = nil,
}

lualine.setup {
  options = {
    icons_enabled = false,
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    refresh = {
      statusline = 500
    },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
  },
  sections = {
    lualine_a = {
      {
        function()
          return " "
        end,
        padding = 0,
      },
    },
    lualine_b = { "branch" },
    lualine_c = {
      "filename",
      diff_section,
      "diagnostics",
    },
    lualine_x = {
      {
        function()
          local msgs = lsp_status.messages()
          for _, msg in ipairs(msgs) do
            if not tonumber(msg.name) then
              return string.format("%s %s", msg.name, msg.percentage) .. "%%"
            end

            return string.format("%s %s", msg.title, msg.percentage) .. "%%"
          end

          return ""
        end,
      },
      "fileformat",
      "filetype",
    },
    lualine_y = { "location" },
    lualine_z = {},
  },
}

-- lualine.setup {
--   options = {
--     icons_enabled = true,
--     theme = "auto",
--     component_separators = { left = "|", right = "|" },
--     section_separators = { left = "|", right = "|" },
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     globalstatus = false,
--     refresh = {
--       statusline = 1000,
--       tabline = 1000,
--       winbar = 1000,
--     },
--   },
--   sections = {
--     lualine_a = {
--       {
--         "mode",
--         padding = 0,
--         fmt = function(str)
--           return " "
--         end,
--       },
--     },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = { "fileformat", "filetype" },
--     lualine_y = { "location" },
--     lualine_z = {},
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   winbar = {},
--   inactive_winbar = {},
--   extensions = {},
-- }
