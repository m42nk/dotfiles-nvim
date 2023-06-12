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
    ["ts"] = { "<cmd>MarksToggleSigns<cr>", "MarksToggleSigns" },

    ["lb"] = { "<cmd>MarksListBuf<cr>", "MarksListBuf" },
    ["la"] = { "<cmd>MarksListAll<cr>", "MarksListAll" },
    ["lg"] = { "<cmd>MarksListGlobal<cr>", "MarksListGlobal" },

    ["bl"] = { "<cmd>BookmarksList<cr>", "BookmarksList" },
    ["ba"] = { "<cmd>BookmarksListAll<cr>", "BookmarksListAll" },

    ["bql"] = { "<cmd>BookmarksQFList<cr>", "BookmarksQFList" },
    ["bqa"] = { "<cmd>BookmarksQFListAll<cr>", "BookmarksQFListAll" },

    ["ql"] = { "<cmd>MarksQFListBuf<cr>", "MarksQFListBuf" },
    ["qa"] = { "<cmd>MarksQFListAll<cr>", "MarksQFListAll" },
    ["qg"] = { "<cmd>MarksQFListGlobal<cr>", "MarksQFListGlobal" },
  },
}
