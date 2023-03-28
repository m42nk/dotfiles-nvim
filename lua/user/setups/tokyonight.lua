local ok, tokyonight = pcall(require, "tokyonight")
if not ok then
  return
end

tokyonight.setup {
  transparent = true
}
