local ok, ts = pcall(require, "typescript")
if not ok then
  return
end

ts.setup {
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
}

require("user.utils.keymaps").nmap {
  ["<leader>T"] = {
    name = "Typescript",
    ["im"] = { "<cmd>TypescriptAddMissingImports<cr>", "Add missing imports" },
    ["io"] = { "<cmd>TypescriptOrganizeImports<cr>", "Organize imports" },
    ["f"] = { "<cmd>TypescriptFixAll<cr>", "Fix all" },
    ["ru"] = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused Imports" },
    ["rn"] = { "<cmd>TypescriptRenameFile<cr>", "Rename file" },
    ["gd"] = {
      "<cmd>TypescriptGoToSourceDefinition<cr>",
      "Go to source definition",
    },
  },
}
