local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

local active = true

if active then
	-- Defer the call
	vim.schedule(function()
    -- TODO: Probably change this, since it's an interal function of project_nvim
    local project_ok, project_root = pcall(require("project_nvim.project").get_project_root, "")

    -- Check if project_nvim is configured
    if not project_ok then
      return
    end

		-- Cancel if vim called with any arguments
		if next(vim.fn.argv()) ~= nil then
			return
		end

    -- Cancel if project_root is not found
		if not project_root then
			return
		end

		local oldfiles = vim.v.oldfiles
		local target = nil

		for _, filepath in pairs(oldfiles) do
			if vim.startswith(filepath, project_root) then
				target = filepath
				break
			end
		end

		if target then
			vim.cmd("e " .. target)
		end
	end)
end
