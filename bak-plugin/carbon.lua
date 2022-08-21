local ok, carbon = pcall(require, "carbon")
if not ok then
  return
end

carbon.setup {
  setting = "value",
}
