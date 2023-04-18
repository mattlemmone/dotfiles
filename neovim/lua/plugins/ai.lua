return {
  "github/copilot.vim",
  {
    "dense-analysis/neural",
    config = function()
      require("neural").setup({
        source = {
          openai = {
            api_key = vim.env.OPENAI_API_KEY,
          },
        },
      })
    end,
  },
}
