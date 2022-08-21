local ok, comment = pcall(require, "Comment")
if not ok then return end

comment.setup {
    padding = true,
    sticky = true,
    ignore = '^$',
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
}

-- Comment string for specific ft
-- can be used if ft doesn't support commenting

local ft = require("Comment.ft")
ft.set("yaml", {"#%s "})

