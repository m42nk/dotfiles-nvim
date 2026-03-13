---@type LazySpec
return {
  -- Renderer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = {
        lsp = { enabled = true },

        -- TODO: check if this is needed since it mentioned in the docs that blink is automatically enabled
        blink = { enabled = true },
      },
      render_modes = { "n", "c", "t", "i" },
      heading = {
        border = { true, false },
        border_virtual = true,

        position = "inline",
        left_pad = { 1 },
        right_pad = { 2 },

        width = { "full", "block" },
        min_width = { 0, 90, 10 },

        sign = true,

        icons = { "H1 ", "H2 ", "H3 ", "H4 ", "H5 ", "H6 " },

        -- TODO: colors
        -- backgrounds = {
        --     'RenderMarkdownH1Bg',
        --     'RenderMarkdownH2Bg',
        --     'RenderMarkdownH3Bg',
        --     'RenderMarkdownH4Bg',
        --     'RenderMarkdownH5Bg',
        --     'RenderMarkdownH6Bg',
        -- },
        -- foregrounds = {
        --     'RenderMarkdownH1',
        --     'RenderMarkdownH2',
        --     'RenderMarkdownH3',
        --     'RenderMarkdownH4',
        --     'RenderMarkdownH5',
        --     'RenderMarkdownH6',
        -- },
      },
    },
  },

  -- Tools
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "prettier", "markdown-toc", "markdownlint-cli2" } },
  },

  -- Formatters
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find "<!%-%- toc %-%->" then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      },
    },
  },

  -- External Previewer
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load { plugins = { "markdown-preview.nvim" } }
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
