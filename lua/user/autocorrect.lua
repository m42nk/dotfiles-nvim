-- Put common typos here
-- vim.cmd [[
-- iabbrev <silent> heigth height
-- iabbrev <silent> hiegth height
-- iabbrev <silent> funciton function
-- iabbrev <silent> cosnt const
-- iabbrev <silent> costn const
-- iabbrev <silent> retrun return
-- iabbrev <silent> copmuted computed
-- iabbrev <silent> comupted computed
-- iabbrev <silent> gruop group
-- ]]

local words = {
  heigth = "height",
  hiegth = "height",
  funciton = "function",
  cosnt = "const",
  costn = "const",
  retrun = "return",
  copmuted = "computed",
  comupted = "computed",
  gruop = "group",
}

-- vim.nvim_set_keymap('!a', 'heigth', 'height', {noremap = true, silent = true})

for k, v in pairs(words) do
  vim.cmd("iabbrev <silent> " .. k .. " " .. v)

  -- Capitalized
  local firstChar = function(w)
    return string.sub(w, 1, 1)
  end

  local rest = function(w)
    return string.sub(w, 2)
  end

  vim.cmd("iabbrev <silent> " .. firstChar(k):upper() .. rest(k) .. " " .. firstChar(v):upper() .. rest(v))
end
