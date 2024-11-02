return {
  "folke/todo-comments.nvim",
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
