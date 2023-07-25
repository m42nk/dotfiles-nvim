local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
	return
end

tokyonight.setup {
  transparent = true,
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
}

vim.cmd([[colorscheme tokyonight]])
