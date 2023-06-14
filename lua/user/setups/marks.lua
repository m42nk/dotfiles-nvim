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

--     mx              Set mark x
--     m,              Set the next available alphabetical (lowercase) mark
--     m;              Toggle the next available mark at the current line
--     dmx             Delete mark x
--     dm-             Delete all marks on the current line
--     dm<space>       Delete all marks in the current buffer
--     m]              Move to next mark
--     m[              Move to previous mark
--     m:              Preview mark. This will prompt you for a specific mark to
--                     preview; press <cr> to preview the next mark.
--                     
--     m[0-9]          Add a bookmark from bookmark group[0-9].
--     dm[0-9]         Delete all bookmarks from bookmark group[0-9].
--     m}              Move to the next bookmark having the same type as the bookmark under
--                     the cursor. Works across buffers.
--     m{              Move to the previous bookmark having the same type as the bookmark under
--                     the cursor. Works across buffers.
--     dm=             Delete the bookmark under the cursor.
