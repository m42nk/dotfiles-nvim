local vscode = require('vscode-neovim')

vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function vsmap(mode, lhs, commandId)
    vim.keymap.set(mode, lhs, function() vscode.action(commandId) end)
end

local function vsnmap(lhs, commandId)
    vim.keymap.set({ "n" }, lhs, function() vscode.action(commandId) end)
end

-- General
vim.keymap.set({ "n" }, "<leader>e", function() vscode.action("workbench.view.explorer") end)
vim.keymap.set({ "n" }, "<leader><leader>", function() vscode.action("workbench.action.files.save") end)
vim.keymap.set({ "n" }, "<leader>lf", function() vscode.action("editor.action.formatDocument") end)
vim.keymap.set({ "v" }, "<leader>lf", function() vscode.action("editor.action.formatSelection") end)

-- Comment
vsmap({ "n", "v" }, "<leader>/", "editor.action.commentLine")

-- LSP
vsnmap("gd", "editor.action.revealDefinition")
vsnmap("gD", "editor.action.peekDefinition")

vsnmap("gy", "editor.action.goToTypeDefinition")
vsnmap("gY", "editor.action.peekTypeDefinition")

vsnmap("gr", "editor.action.goToReferences")
vsnmap("gR", "editor.action.referenceSearch.trigger")