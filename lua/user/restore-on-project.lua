local active = true

if active then
	-- Defer the call
	vim.schedule(function()
        -- TODO: Probably change this, since it's an interal function of project_nvim
		local project_root = require("project_nvim.project").get_project_root()

		-- Cancel if vim called with any arguments
		if next(vim.fn.argv()) ~= nil then
			return
		end

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
