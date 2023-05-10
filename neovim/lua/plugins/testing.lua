return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      {
        "nvim-neotest/neotest-vim-test",
        lazy = true,
        dependencies = {
          {
            "vim-test/vim-test",
            lazy = true,
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
