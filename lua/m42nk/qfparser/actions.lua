local M = {}

-- GitLab link converter (assuming default branch and GitLab-compatible remote)
function M.to_gitlab_link(entry)
  local file = vim.fn.fnamemodify(entry.filename, ":.")
  local handle = io.popen "git config --get remote.origin.url"
  local origin = handle:read("*a"):gsub("%s+$", "")
  handle:close()

  -- Parse to HTTPS URL
  if origin:match "^git@" then
    origin = origin:gsub(":", "/"):gsub("^git@", "https://"):gsub("%.git$", "")
  elseif origin:match "^https://" then
    origin = origin:gsub("%.git$", "")
  end

  local handle2 = io.popen "git rev-parse --abbrev-ref HEAD"
  local branch = handle2:read("*a"):gsub("%s+$", "")
  handle2:close()

  return string.format("%s/-/blob/%s/%s#L%d", origin, branch, file, entry.lnum)
end

-- CLI command converter (e.g., open in nvim)
function M.to_cli_cmd(entry)
  return string.format("nvim +%d %s", entry.lnum, entry.filename)
end

function M.to_plain(entry)
  return string.format("%s:%d:%d %s", entry.filename, entry.lnum, entry.col, entry.text)
end


return M
