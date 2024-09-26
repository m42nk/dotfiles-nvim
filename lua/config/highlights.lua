vim.api.nvim_set_hl(0, "@markup.raw", { fg = "#c5c8c6", bg = "#1e1e1e", default = false })
vim.api.nvim_set_hl(0, "@comment", { fg = "#c5c8c6", italic = true, default = false })
-- vim.api.nvim_set_hl(0, '@text.code', {bg = '#000FFF'})

vim.api.nvim_set_hl(0, "Search", { bg = "yellow", fg = "black", default = false, italic = true })
vim.api.nvim_set_hl(0, "IncSearch", { link = "Search" })

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1e1e1e", default = false })
vim.api.nvim_set_hl(0, "Folded", { bg = "#282A2E", default = false })

-- vim.api.nvim_set_hl(0, "Visual", { bg = "#707880", default = false })
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#373B41", default = false })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#373B41", default = false })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#373B41", default = false })

vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "red", fg = "white", default = false })
