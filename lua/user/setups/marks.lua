local ok, marks = pcall(require, "marks")

if not ok then
  return
end

marks.setup {}

-- :MarksToggleSigns[ buffer] Toggle signs globally. Also accepts an optional buffer number to toggle signs for that buffer only.
-- :MarksListBuf Fill the location list with all marks in the current buffer.
-- :MarksListGlobal Fill the location list with all global marks in open buffers.
-- :MarksListAll Fill the location list with all marks in all open buffers.
-- :BookmarksList group_number Fill the location list with all bookmarks of group "group_number".
-- :BookmarksListAll Fill the location list with all bookmarks, across all groups.
-- :MarksQFListBuf
-- :MarksQFListGlobal
-- :MarksQFListAll
-- :BookmarksQFList group_number
-- :BookmarksQFListAll

require("user.utils.keymaps").nmap {
  ["<leader>m"] = {
    name = "Marks",
    ["t"] = { "<cmd>MarksToggleSigns<cr>", "MarksToggleSigns" },

    ["l"] = {
      name = "Mark List",
      ["b"] = { "<cmd>MarksListBuf<cr>", "MarksListBuf" },
      ["a"] = { "<cmd>MarksListAll<cr>", "MarksListAll" },
      ["g"] = { "<cmd>MarksListGlobal<cr>", "MarksListGlobal" },
    },

    ["q"] = {
      name = "Quickfix",
      ["l"] = { "<cmd>MarksQFListBuf<cr>", "MarksQFListBuf" },
      ["a"] = { "<cmd>MarksQFListAll<cr>", "MarksQFListAll" },
      ["g"] = { "<cmd>MarksQFListGlobal<cr>", "MarksQFListGlobal" },
    },
    ["b"] = {
      name = "Bookmark",
      ["l"] = { "<cmd>BookmarksList<cr>", "BookmarksList" },
      ["a"] = { "<cmd>BookmarksListAll<cr>", "BookmarksListAll" },

      ["q"] = {
        name = "Quickfix",
        ["l"] = { "<cmd>BookmarksQFList<cr>", "BookmarksQFList" },
        ["a"] = { "<cmd>BookmarksQFListAll<cr>", "BookmarksQFListAll" },
      },
    },
  },
}
