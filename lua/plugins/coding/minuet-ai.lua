return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    provider = "openai",
    -- lsp = {
    --   inline_completion = {
    --     enable = true,
    --     enabled_auto_trigger_ft = {},
    --   },
    -- },

    -- Your configuration options here
    provider_options = {
      openai = {
        model = "gpt-5.4-nano",
        end_point = "https://api.openai.com/v1/chat/completions",
        -- system = "see [Prompt] section for the default value",
        -- few_shots = "see [Prompt] section for the default value",
        -- chat_input = "See [Prompt Section for default value]",
        stream = true,
        api_key = "OPENAI_API_KEY",
        optional = {
          -- pass any additional parameters you want to send to OpenAI request,
          -- e.g.
          -- stop = { 'end' },
          -- max_completion_tokens = 256,
          -- top_p = 0.9,
          -- reasoning_effort = 'minimal'
          -- reasoning_effort = 'none'
        },
        -- a list of functions to transform the endpoint, header, and request body
        transform = {},
      },
    },

    duet = {
      provider = "openai",
      provider_options = {
        openai = {
          model = "gpt-5.4-mini", -- Default OpenAI model for duet requests.
          api_key = "OPENAI_API_KEY",
        },
      },
    },
  },
  keys = {
    { "<leader>mp", "<cmd>Minuet duet predict<cr>", mode = { "n" }, desc = "Minuet duet predict" },
    { "<leader>ma", "<cmd>Minuet duet apply<cr>", mode = { "n" }, desc = "Minuet duet apply" },
    { "<leader>md", "<cmd>Minuet duet dismiss<cr>", mode = { "n" }, desc = "Minuet duet dismiss" },
    { "<A-z>", "<cmd>Minuet duet predict<cr>", mode = { "i" }, desc = "Minuet duet predict" },
    { "<A-a>", "<cmd>Minuet duet apply<cr>", mode = { "i" }, desc = "Minuet duet apply" },
    { "<A-x>", "<cmd>Minuet duet dismiss<cr>", mode = { "i" }, desc = "Minuet duet dismiss" },
  },
}
