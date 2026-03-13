---@type LazySpec
return {
  "folke/todo-comments.nvim",
  version = "~v1.5.0",
  opts = {
    keywords = {
      DANGER = { icon = " ", color = "error" },
      SAKIS = { icon = "", color = "error" },
      NOTE = { icon = "⏲ ", color = "note" },
      -- ["SAKIS:TODO"] = { icon = "", color = "blue" },
      -- ["SAKIS:INFO"] = { icon = "", color = "blue" },
      -- ["SAKIS:NOTE"] = { icon = "", color = "yellow" },
    },
    highlight = {
      multiline_pattern = "^ ",
    },
    colors = {
      note = { "WarningMsg", "#ffaf00" },
    },
  },
}
