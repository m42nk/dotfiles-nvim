-- Commandline abbreviations
vim.cmd.cabbrev("Wq", "wq")
vim.cmd.cabbrev("Wqa", "wqa")
vim.cmd.cabbrev("W", "w")
vim.cmd.cabbrev("Q", "q")
vim.cmd.cabbrev("Qa", "qa")
vim.cmd.cabbrev("Set", "set")

-- Insert mode abbreviations
local abbrevs = {
  "reutrn : return",
  "pacakge : package",
  "destinatino : destination",

  "shuold : should",
  "shoudl : should",

  "addres : address",
  "adress : address",

  "sucess : success",
  "sucessful : successful",
  "sucessfully : successfully",
  "sucessfull : successful",

  "succes : success",
  "succesful : successful",
  "succesfully : successfully",

  "mokcs : mocks",
  "mokc: mock",

  "resposne : response",
  "responses : responses",
}

for _, value in pairs(abbrevs) do
  local lhs, rhs = unpack(vim.split(value, ":"))
  lhs = vim.fn.trim(lhs)
  rhs = vim.fn.trim(rhs)
  vim.cmd.iabbrev(lhs, rhs)
end
