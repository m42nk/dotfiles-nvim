---@type LazySpec
return {
  "sindrets/diffview.nvim",
  opts = {
    enhanced_diff_hl = true, -- See |diffview-config-enhanced_diff_hl|
    view = {
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = true, -- See |diffview-config-view.x.winbar_info|
      },
    },
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff View Open" },
  },
}
