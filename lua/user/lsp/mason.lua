local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

mason.setup()

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

mason_lspconfig.setup {
  ensure_installed = {
    "emmet-ls",
    "codespell",
    -- "misspell",
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
  },
}

-- Custom `ensure_installed` for Mason (installing other than lsp)
-- TODO: not implemented
-- although checking it on every startup might be slower and inefficient
-- probably move it to config install script, using headless install


local opts = {
  on_attach = require "user.lsp.on_attach",
  capabilities = require "user.lsp.capabilities",
}

local configs = {
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
}

-- TODO: probably need a refactor
local extend = function(target, src)
  return vim.tbl_deep_extend("force", target, src) or {}
end

configs = extend(configs, require("user.lsp.settings").custom_configurations(opts))
configs = extend(configs, {
  ["jsonls"] = function()
    local _opts = extend(opts, {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    require("lspconfig").jsonls.setup(_opts)
  end,
})

mason_lspconfig.setup_handlers(configs)

--[[ lsp_installer.on_server_ready(function(server) ]]
--[[   local opts = vim.deepcopy(common_setup_opts) ]]
--[[   if server_opts[server.name] then ]]
--[[     opts = vim.tbl_deep_extend("force", opts, server_opts[server.name]) ]]
--[[   end ]]
--[[   server:setup(opts) ]]
--[[ end) ]]
