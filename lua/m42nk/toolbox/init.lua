local M = {}

-- Configuration table mapping root paths to app and project names
local toolbox_config = {
  ["/Users/syakhisk.syari/Work/octopus"] = { app = "goland", project = "octopus" },
  ["/Users/syakhisk.syari/Work/order-workflow-orchestrator"] = {
    app = "goland",
    project = "order-workflow-orchestrator",
  },
  ["/Users/syakhisk.syari/Work/transport-user-config-service"] = {
    app = "goland",
    project = "transport-user-config-service",
  },
  ["/Users/syakhisk.syari/Work/trams"] = { app = "goland", project = "trams" },
  ["/Users/syakhisk.syari/Work/traps"] = { app = "goland", project = "traps" },
  ["/Users/syakhisk.syari/Work/transport_oms"] = { app = "goland", project = "transport_oms" },
  ["/Users/syakhisk.syari/Work/transport-cancellation-service"] = {
    app = "goland",
    project = "transport-cancellation-service",
  },
  ["/Users/syakhisk.syari/Work/tipping-service"] = { app = "goland", project = "tipping-service" },
  ["/Users/syakhisk.syari/Work/_projects/toolbelt"] = { app = "goland", project = "toolbelt" },

  ["/Users/syakhisk.syari/Work/ride-service"] = { app = "rubymine", project = "ride-service" },
  ["/Users/syakhisk.syari/Work/eta-tractor"] = { app = "idea", project = "eta-tractor" },
  ["/Users/syakhisk.syari/Work/notifactor"] = { app = "idea", project = "notifactor" },
}

-- Function to find the root path for the current file
local function find_project_root()
  local cwd = vim.fn.getcwd()
  for root, _ in pairs(toolbox_config) do
    if cwd:find(root, 1, true) == 1 then
      return root
    end
  end
  return nil
end

local function guess_project_ide()
  local file_path = vim.api.nvim_buf_get_name(0)
  if file_path:find "%.go$" then
    return "goland"
  elseif file_path:find "%.rb$" then
    return "rubymine"
  elseif file_path:find "%.js$" or file_path:find "%.ts$" then
    return "webstorm"
  else
    return "idea"
  end
end

local function get_toolbox_url()
  -- Get the current buffer name (full path of the file)
  local file_path = vim.api.nvim_buf_get_name(0)
  if file_path == "" then
    vim.api.nvim_err_writeln "No file path found"
    return
  end

  -- Get the current cursor position (line and column)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line_num = cursor[1]
  local col_num = cursor[2] + 1 -- Convert 0-based column index to 1-based

  -- Find the project root
  local project_root = find_project_root()
  local app, project = "", ""
  if project_root then
    -- Get the app and project configuration for the current root path
    local config = toolbox_config[project_root]
    app, project = config.app, config.project
  else
    vim.notify(
      "Project root not found in configuration, guessing IDE and using current directory as project",
      vim.log.levels.WARN
    )
    app = guess_project_ide()
    project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  end

  -- Create the JetBrains Toolbox URL
  local toolbox_url = string.format(
    "jetbrains://%s/navigate/reference?project=%s&path=%s:%d:%d",
    app,
    project,
    file_path,
    line_num,
    col_num
  )

  return toolbox_url
end

M.setup = function()
  require("lazyvim.util").on_load("which-key.nvim", function()
    require("which-key").add {
      { "<leader>gt", desc = "Jetbrains Toolbox", mode = { "n", "v" } },
    }
  end)
end

-- Function to convert the current position into a JetBrains Toolbox URL
M.copy_to_clipboard = function()
  local toolbox_url = get_toolbox_url()
  -- Optionally, copy the result to the clipboard
  vim.fn.setreg("+", toolbox_url)

  -- Optionally, print the result to the command line
  vim.api.nvim_out_write(toolbox_url .. "\n")
end

M.open_in_toolbox = function()
  local toolbox_url = get_toolbox_url()
  if toolbox_url then
    -- -- Open the Toolbox URL in the default browser
    -- vim.fn.jobstart({ "open", toolbox_url }, { detach = true })

    -- Define the shell command to execute with the URL
    local shell_command = string.format("/usr/bin/open '%s'", toolbox_url)

    -- Execute the shell command
    vim.fn.system(shell_command)

    -- Optionally, print the result to the command line for debugging
    vim.api.nvim_out_write("Executed command: " .. shell_command .. "\n")
  end
end

return M
