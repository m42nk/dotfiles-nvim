-- Combinations of w, q, a, !
local abbrevs = [[
W w
W! w!
Q q
Q! q!

WQ wq
WQ! wq!

Wa wa
Wa! wa!
WA wA
WA! wA!
Wq wq
Wq! wq!
Wqa wqa
Wqa! wqa!

Qa qa
Qa! qa!
QA qA
QA! qA!
]]

for line in abbrevs:gmatch "[^\r\n]+" do
  local parts = {}
  for part in line:gmatch "%S+" do
    table.insert(parts, part)
  end
  local lhs = parts[1]
  local rhs = parts[2]
  vim.cmd("cnoreabbrev " .. lhs .. " " .. rhs)
end
