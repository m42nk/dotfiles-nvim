local Util = require "lazyvim.util"
local M = {}

-- NOTE: use `normalize` instead of `joinpath` since its not available in 0.9.4
-- local lazy_path = vim.fs.normalize(tostring(vim.fn.stdpath "data") .. "/lazy" .. "/LazyVim")
-- local lazy_path = vim.fs.joinpath(tostring(vim.fn.stdpath "data"), "lazy", "LazyVim")

local data_path = tostring(vim.fn.stdpath "data") -- $HOME/.local/share/nvim

function M.find_files()
  return function()
    if not vim.fn.executable "rg" then
      require("telescope.builtin").find_files()
      return
    end

    require("telescope.builtin").find_files {
      find_command = {
        "rg",
        "--follow", -- Follow symbolic links
        "--no-ignore-vcs", -- Include files in .gitignore
        "--hidden", -- Search for hidden files
        "--no-heading", -- Don't group matches by each file
        "--files", -- search files instead of content
        "--line-number", -- Show line numbers
        "--column", -- Show column numbers
        "--smart-case", -- Smart case search

        -- Exclude some patterns from search
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/node_modules/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    }
  end
end

function M.live_grep()
  return function()
    if not vim.fn.executable "rg" then
      require("telescope.builtin").live_grep()
      return
    end

    require("telescope.builtin").live_grep {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-ignore-vcs",
        "--hidden",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",

        -- Exclude some patterns from search
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/node_modules/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    }
  end
end

function M.lazyvim_files()
  local lazy_path = vim.fs.joinpath(data_path, "lazy", "LazyVim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.lazyvim_tree()
  local path = vim.fs.joinpath(data_path, "lazy", "LazyVim")
  return function()
    require("neo-tree.command").execute {
      action = "focus",
      source = "filesystem",
      dir = path,
    }
  end
end

function M.lazynvim_files()
  local lazy_path = vim.fs.joinpath(data_path, "lazy", "lazy.nvim")
  return Util.telescope("find_files", { cwd = lazy_path })
end

function M.global_todo_files()
  return Util.telescope("find_files", {
    -- cwd = vim.fs.joinpath(tostring(os.getenv "HOME"), "Todos"),
    cwd = vim.fs.normalize(tostring(os.getenv "HOME") .. "/Todos"),
  })
end

return M
