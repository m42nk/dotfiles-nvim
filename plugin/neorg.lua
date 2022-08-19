local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    --[[ ["core.presenter"] = {}, ]]
    --[[ ["core.gtd.base"] = {}, ]]
    --[[ ["core.norg.qol.toc"] = {}, ]]
    --[[ ["core.norg.concealer"] = {}, ]]
    --[[ ["core.norg.completion"] = {}, ]]
    --[[ ["core.norg.dirman"] = { ]]
    --[[   config = { ]]
    --[[     workspaces = { ]]
    --[[       brain = "~/Notes/brain", ]]
    --[[       other = "~/Notes/other", ]]
    --[[     }, ]]
    --[[   }, ]]
    --[[ }, ]]
  },
}
