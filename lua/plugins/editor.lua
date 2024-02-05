return {
  require "plugins.editor.neo-tree",
  require "plugins.editor.telescope",
  require "plugins.editor.which-key",
  require "plugins.editor.mini-misc",
  require "plugins.editor.mini-indentscope",
  require "plugins.editor.activity-watch",
  require "plugins.editor.markdown",
  require "plugins.editor.gitlinker",
  require "plugins.editor.bookmarks",
  -- TODO: move to proper file
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bn", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>bp", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
      { "<leader>bP", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>b0", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
      { "<leader>bS", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort buffer by directory" },
      { "<c-s-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<c-s-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer previous" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghq", gs.setqflist, "Hunk on Quickfix")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
