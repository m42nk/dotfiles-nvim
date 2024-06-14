return {
  "folke/todo-comments.nvim",
  opts = {
    keywords = {
      SAKIS = { icon = "", color = "error" },
      -- ["SAKIS:TODO"] = { icon = "", color = "blue" },
      -- ["SAKIS:INFO"] = { icon = "", color = "blue" },
      -- ["SAKIS:NOTE"] = { icon = "", color = "yellow" },
    },
    highlight = {
      multiline_pattern = "^ ",
    },
  },
}
