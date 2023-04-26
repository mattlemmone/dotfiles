return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "nvim-neotest/neotest-vim-test",
        dependencies = { "vim-test/vim-test" },
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
