return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    version = "*",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_open_ip = "0.0.0.0"
      vim.g.mkdp_page_title = "${name}"
      vim.g.mkdp_theme = "light"
      vim.g.mkdp_combine_preview = true
      vim.g.mkdp_echo_preview_url = true

      if vim.fn.has "macunix" then
        vim.g.mkdp_browser = "/Applications/Min.app/Contents/MacOS/Min"
      end
    end,
    keys = {
      { "<leader>um", vim.cmd.MarkdownPreviewToggle, desc = "Toggle Markdown Preview" },
    },
  },
}
