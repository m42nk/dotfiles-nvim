local nio = require "nio"

vim.print(nio)
--
-- local str = 'test-explore/num/num_suite_test.go::Test_IsOdd::"when the number is actually odd"::3_should_return_true'
-- local matched = str:gsub("/[%w_-]*_test.go", ""):gsub("\"", ""):gsub(" ", "_")
--
-- -- vim.print(matched)
--
-- local str2 = 'geming::asd'
-- local matched2 = str2:gsub("::", "_")
-- vim.print(matched2)
--

-- "Hello \"world\"!!"

if true then
  vim.print "true"
else
  vim.print "false"
end
