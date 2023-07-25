--
-- Loads all configuration files from the current directory and subdirectories.
--

local filename = debug.getinfo(1, "S").source:sub(2)
local base_dir = vim.fn.fnamemodify(filename, ":h")

-- get all *.lua or */init.lua files from base_dir
for _, file in ipairs(vim.fn.globpath(base_dir, "**/*.lua", true, true)) do
	if not file:match(base_dir .. "/init%.lua") then
		-- Remove base_dir from string
		file = file:gsub(base_dir .. "/", "")

		-- Remove .lua from string
		file = file:gsub("%.lua$", "")

		-- Remove /init from string
		if file:match("/init$") then
			file = file:gsub("/init$", "")
		end

		-- Replace / with .
    file = file:gsub("/", ".")

    -- Load file
    local current_module = (...)
    local ok, _ = pcall(require, current_module .. '.' .. file)
    if not ok then
      print("Error loading " .. file)
    end
	end
end
