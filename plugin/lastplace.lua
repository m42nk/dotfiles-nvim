local ok, lastplace = pcall(require, "nvim-lastplace")

ok = false

if not ok then
  return
end

lastplace.setup {
  lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
  lastplace_ignore_filetype = { "gitcommit", "gitrebase", "packer" },
  lastplace_open_folds = false,
}
