vim.keymap.set("n", "<leader>CCa", "<cmd>GoCodeLenAct<cr>", { desc = "Golang Code Actions (codelens)", silent = false })
vim.keymap.set("n", "<leader>CCi", "<cmd>GoIfErr<cr>", { desc = "Golang If Err", silent = false })
vim.keymap.set("n", "<leader>CCf", "<cmd>GoFillStruct<cr>", { desc = "Golang Fill Struct", silent = false })
vim.keymap.set("n", "<leader>CCI", "<cmd>lua require'telescope'.extensions.goimpl.goimpl()<CR>", { desc = "Goimpl" })

vim.keymap.set("n", "<leader>CCzo", "<cmd>GoFoldTestOpen<cr>", { desc = "Golang Fold Test Open", silent = false })
vim.keymap.set("n", "<leader>CCzc", "<cmd>GoFoldTestClose<cr>", { desc = "Golang Fold Test Close", silent = false })
vim.keymap.set("n", "<leader>CCza", "<cmd>GoFoldTestToggle<cr>", { desc = "Golang Fold Test Toggle", silent = false })
-- stylua: ignore
vim.keymap.set( "n", "<leader>CCzC", "<cmd>GoFoldZeeTestClose<cr>", { desc = "Golang Fold Zee Test Close", silent = false })

vim.api.nvim_create_user_command("GoFoldTestClose", [[g/^\st.Run/norm zc]], {})
vim.api.nvim_create_user_command("GoFoldTestOpen", [[g/^\st.Run/norm zo]], {})
vim.api.nvim_create_user_command("GoFoldTestToggle", [[g/^\st.Run/norm za]], {})

vim.api.nvim_create_user_command("GoFoldZeeTestClose", [[g/^func.\{-}Test.\{-}()/norm zc]], {})
