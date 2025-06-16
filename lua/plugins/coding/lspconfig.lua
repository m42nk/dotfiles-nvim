return {
  {
    "neovim/nvim-lspconfig",

    opts = function(_, opts)
      local override = {
        ---@type vim.diagnostic.Opts
        diagnostics = {
          virtual_text = false,
          underline = true,
        },

        -- Disable inlay hints by default, show it using <Leader>uh
        inlay_hints = { enabled = false },

        -- Disable codelens by default, it will be enabled on init function
        codelens = { enabled = false },
        setup = {
          golangci_lint_ls = function(_, opts)
            require("lspconfig").golangci_lint_ls.setup {}
          end,
          lua_ls = function(_, opts)
            require("lspconfig").lua_ls.setup {
              on_init = function(client)
                if client.workspace_folders then
                  local path = client.workspace_folders[1].name
                  if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                    return
                  end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                  },
                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                      -- Depending on the usage, you might want to add additional paths here.
                      -- "${3rd}/luv/library"
                      -- "${3rd}/busted/library",
                    },
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                    -- library = vim.api.nvim_get_runtime_file("", true)
                  },
                })
              end,
              settings = {
                Lua = {},
              },
            }
          end,

          -- ["*"] = function(server, opts) end,
        },
        servers = {
          gopls = {
            settings = {
              gopls = {
                gofumpt = false,
                analyses = {
                  fieldalignment = false, -- "struct with yyyy pointer bytes could be xxx"
                },
              },
            },
          },
        },
      }

      --
      -- Add custom keymaps
      --
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- stylua: ignore
      keys[#keys + 1] = {
        "gi",
        function() require("telescope.builtin").lsp_implementations { reuse_win = false, show_line = false } end,
        desc = "G To Implementations",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "gd",
        function() require("telescope.builtin").lsp_definitions({ reuse_win = false, show_line = false }) end,
        desc = "Goto Definition",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = {
        "<leader>cgd",
        function() require("telescope.builtin").lsp_definitions({ jump_type = "vsplit", show_line = false }) end,
        desc = "Goto Definition (Split)",
        has = "definition",
      }

      -- stylua: ignore
      keys[#keys + 1] = { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = false }) end, desc = "Goto T[y]pe Definition" }

      -- stylua: ignore
      keys[#keys + 1] = { "gr", function() require("telescope.builtin").lsp_references({ reuse_win = false, show_line = false, include_current_line = false }) end, desc = "References" }

      -- stylua: ignore
      keys[#keys + 1] = { "gx", vim.lsp.buf.declaration, desc = "Goto Declaration" }

      -- Unbind
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }

      opts = vim.tbl_deep_extend("force", opts, override)

      return opts
    end,
    init = function()
      -- HACK: fix noisy error: "method textDocument/codeLens is not supported by any of the servers registered for the current buffer"
      if vim.lsp.codelens then
        LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
          -- Disable codelense on lua
          if client.name == "lua_ls" then
            return
          end

          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = buffer,
            callback = function()
              local bufname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buffer), ":p:.")
              -- vim.notify_once(string.format("codelens:: client: %s, buffer: %d (%s)", client.name, buffer, bufname))
              -- add buffer number here (not in lazyvim)
              vim.lsp.codelens.refresh { bufnr = buffer }
            end,
          })
        end)
      end
      -- LazyVim.lsp.on_attach(function(client, buffer)
      --   if not client.supports_method "textDocument/codeLens" then
      --   end
      -- end)
    end,
  },
}
