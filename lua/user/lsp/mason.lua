require("mason").setup {}

require("mason-tool-installer").setup {
  auto_update = false,

  -- Lazy load autostart by 3 seconds
  -- So it doesn't effect startup time
  run_on_start = true,
  start_delay = 3000,

  ensure_installed = {
    "gopls",
    "bash-language-server",
    "html-lsp",
    "codespell",
    "dockerfile-language-server",
    "fixjson",
    "yamllint",
    "marksman",
    -- "rome",
    "lua-language-server",
    "elixir-ls",
    "tailwindcss-language-server",
    "pyright",
    "shfmt",
    "css-lsp",
    "cmake-language-server",
    "typescript-language-server",
    "python-lsp-server",
    "svelte-language-server",
    "emmet-ls",
    "stylua",
    "shellcheck",
    "prettierd",
  },
}

local opts = {
  on_attach = require "user.lsp.on-attach",
  capabilities = require "user.lsp.capabilities",
}

local configs = {
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
}

-- Load user custom config from settings
configs = vim.tbl_extend(
  "force",
  configs,
  require("user.lsp.settings").custom_configurations(opts)
)

-- Configure schemastore
configs["jsonls"] = function()
  local _opts = vim.tbl_extend("force", opts, {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })

  require("lspconfig").jsonls.setup(_opts)
end

configs["elixirls"] = function()
  local install_path =
    require("mason-registry").get_package("elixir-ls"):get_install_path()

  local bin = install_path .. "/language_server.sh"

  require("lspconfig").elixirls.setup {
    on_attach = opts.on_attach,
    capabilities = opts.capabilities,
    cmd = { bin },
  }
end

-- vim.pretty_print(configs)
-- unpack(require("user.lsp.settings").custom_configurations(opts)),

-- Autosetup installed lsp
require("mason-lspconfig").setup_handlers(configs)
