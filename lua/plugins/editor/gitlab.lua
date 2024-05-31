return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },
  enabled = true,
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  config = function()
    require("gitlab").setup({
      config_path = os.getenv("HOME") .. "/.gitlab.nvim",
    })

    local gitlab = require("gitlab")
    vim.keymap.set("n", "<leader>gllb", gitlab.choose_merge_request, { desc = "Choose gitlab merge request" })
    vim.keymap.set("n", "<leader>gllr", gitlab.review, { desc = "Review gitlab merge request" })
    vim.keymap.set("n", "<leader>glls", gitlab.summary, { desc = "Summary of gitlab merge request" })
    -- vim.keymap.set("n", "<leader>gllA", gitlab.approve, { desc = "Approve gitlab merge request" })
    -- vim.keymap.set("n", "<leader>gllR", gitlab.revoke, { desc = "Revoke gitlab merge request" })
    vim.keymap.set("n", "<leader>gllc", gitlab.create_comment, {desc = "Create comment on gitlab merge request"})
    vim.keymap.set("v", "<leader>gllc", gitlab.create_multiline_comment, {desc = "Create multiline comment on gitlab merge request"})
    vim.keymap.set("v", "<leader>gllC", gitlab.create_comment_suggestion, {desc = "Create comment suggestion on gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllO", gitlab.create_mr, {desc = "Create gitlab merge request"})
    vim.keymap.set("n", "<leader>gllm", gitlab.move_to_discussion_tree_from_diagnostic, {desc = "Move to discussion tree from diagnostic"})
    vim.keymap.set("n", "<leader>glln", gitlab.create_note, {desc = "Create note on gitlab merge request"})
    vim.keymap.set("n", "<leader>glld", gitlab.toggle_discussions, {desc = "Toggle discussions on gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllaa", gitlab.add_assignee, {desc = "Add assignee to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllad", gitlab.delete_assignee, {desc = "Delete assignee from gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllla", gitlab.add_label, {desc = "Add label to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllld", gitlab.delete_label, {desc = "Delete label from gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllra", gitlab.add_reviewer, {desc = "Add reviewer to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gllrd", gitlab.delete_reviewer, {desc = "Delete reviewer from gitlab merge request"})
    vim.keymap.set("n", "<leader>gllp", gitlab.pipeline, {desc = "View pipeline of gitlab merge request"})
    vim.keymap.set("n", "<leader>gllo", gitlab.open_in_browser, {desc = "Open gitlab merge request in browser"})
    -- vim.keymap.set("n", "<leader>gllM", gitlab.merge, {desc = "Merge gitlab merge request"})
    vim.keymap.set("n", "<leader>gllu", gitlab.copy_mr_url, {desc = "Copy gitlab merge request URL"})
    -- vim.keymap.set("n", "<leader>gllP", gitlab.publish_all_drafts, {desc = "Publish all drafts"})
    -- vim.keymap.set("n", "<leader>gllD", gitlab.toggle_draft_mode, {desc = "Toggle draft mode"})
  end,
}
