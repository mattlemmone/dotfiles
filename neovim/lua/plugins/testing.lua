return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      {
        "nvim-neotest/neotest-vim-test",
        event = "VeryLazy",
        dependencies = {
          {
            "vim-test/vim-test",
            event = "VeryLazy",
          },
        },
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vim-test")({
            -- ignore_file_types = { "python", "vim", "lua" },
          }),
        },
      })
    end,
  },
}
