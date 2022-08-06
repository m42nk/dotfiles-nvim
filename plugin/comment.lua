package.loaded['comment'] = nil

local ok, comment = pcall(require, "Comment")
if not ok then
  return
end

comment.setup {
  -- Add a space b/w comment and the line
  padding = true,

  --Whether the cursor should stay at its position
  sticky = true,

  -- Lines to be ignored while comment/uncomment.
  ignore = '^$',

  -- LHS of toggle mappings in NORMAL + VISUAL mode
  toggler = {
    line = "gcc",
    block = "gbc",
  },

  -- LHS of operator-pending mappings in NORMAL + VISUAL mode
  opleader = {
    line = "gc",
    block = "gb",
  },

  -- LHS of extra mappings
  extra = {
    -- Add comment on the line above
    above = "gcO",
    -- Add comment on the line below
    below = "gco",
    -- Add comment at the end of line
    eol = "gcA",
  },

  -- Pre-hook, called before commenting the line
  -- @type fun(ctx: CommentCtx):string
  pre_hook = nil,

  -- Post-hook, called after commenting is done
  -- @type fun(ctx: CommentCtx)
  post_hook = nil,
}
