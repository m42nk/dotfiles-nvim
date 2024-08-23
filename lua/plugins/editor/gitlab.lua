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
    require("gitlab").setup {
      -- config_path = os.getenv "HOME" .. "/.gitlab.nvim",
    }

    local glab = require "gitlab"

    require("lazyvim.util").on_load("which-key.nvim", function()
      require("which-key").add {
        { "<leader>gL", desc = "Gitlab MR", mode = { "n", "v" } },
      }
    end)

    --stylua: ignore start
    vim.keymap.set("n", "<leader>gLb", glab.choose_merge_request, { desc = "Choose gitlab merge request" })
    vim.keymap.set("n", "<leader>gLr", glab.review, { desc = "Review gitlab merge request" })
    vim.keymap.set("n", "<leader>gLs", glab.summary, { desc = "Summary of gitlab merge request" })
    -- vim.keymap.set("n", "<leader>gLA", gitlab.approve, { desc = "Approve gitlab merge request" })
    -- vim.keymap.set("n", "<leader>gLR", gitlab.revoke, { desc = "Revoke gitlab merge request" })
    vim.keymap.set("n", "<leader>gLc", glab.create_comment, {desc = "Create comment on gitlab merge request"})
    vim.keymap.set("v", "<leader>gLc", glab.create_multiline_comment, {desc = "Create multiline comment on gitlab merge request"})
    vim.keymap.set("v", "<leader>gLC", glab.create_comment_suggestion, {desc = "Create comment suggestion on gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLO", gitlab.create_mr, {desc = "Create gitlab merge request"})
    vim.keymap.set("n", "<leader>gLm", glab.move_to_discussion_tree_from_diagnostic, {desc = "Move to discussion tree from diagnostic"})
    vim.keymap.set("n", "<leader>gLn", glab.create_note, {desc = "Create note on gitlab merge request"})
    vim.keymap.set("n", "<leader>gLd", glab.toggle_discussions, {desc = "Toggle discussions on gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLaa", gitlab.add_assignee, {desc = "Add assignee to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLad", gitlab.delete_assignee, {desc = "Delete assignee from gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLla", gitlab.add_label, {desc = "Add label to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLld", gitlab.delete_label, {desc = "Delete label from gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLra", gitlab.add_reviewer, {desc = "Add reviewer to gitlab merge request"})
    -- vim.keymap.set("n", "<leader>gLrd", gitlab.delete_reviewer, {desc = "Delete reviewer from gitlab merge request"})
    vim.keymap.set("n", "<leader>gLp", glab.pipeline, {desc = "View pipeline of gitlab merge request"})
    vim.keymap.set("n", "<leader>gLo", glab.open_in_browser, {desc = "Open gitlab merge request in browser"})
    -- vim.keymap.set("n", "<leader>gLM", gitlab.merge, {desc = "Merge gitlab merge request"})
    vim.keymap.set("n", "<leader>gLu", glab.copy_mr_url, {desc = "Copy gitlab merge request URL"})
    -- vim.keymap.set("n", "<leader>gLP", gitlab.publish_all_drafts, {desc = "Publish all drafts"})
    -- vim.keymap.set("n", "<leader>gLD", gitlab.toggle_draft_mode, {desc = "Toggle draft mode"})
    --stylua: ignore end
  end,
}
