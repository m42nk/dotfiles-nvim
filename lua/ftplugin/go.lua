vim.keymap.set("n", "<leader>cci", "<cmd>GoIfErr<cr>", { desc = "Golang If Err", silent = false })
vim.keymap.set("n", "<leader>ccf", "<cmd>GoFillStruct<cr>", { desc = "Golang Fill Struct", silent = false })

vim.keymap.set("n", "<leader>cczo", "<cmd>GoFoldTestOpen<cr>", { desc = "Golang Fold Test Open", silent = false })
vim.keymap.set("n", "<leader>cczc", "<cmd>GoFoldTestClose<cr>", { desc = "Golang Fold Test Close", silent = false })
vim.keymap.set("n", "<leader>ccza", "<cmd>GoFoldTestToggle<cr>", { desc = "Golang Fold Test Toggle", silent = false })

vim.api.nvim_create_user_command("GoFoldTestClose", [[g/^\st.Run/norm zc]], {})
vim.api.nvim_create_user_command("GoFoldTestOpen", [[g/^\st.Run/norm zo]], {})
vim.api.nvim_create_user_command("GoFoldTestToggle", [[g/^\st.Run/norm za]], {})
