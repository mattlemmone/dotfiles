return {

  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,
  },
  {
    -- if you get issues when installing, make sure to build the binary via `gb`
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim", -- code actions in telescope.. is that all?
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "AckslD/nvim-neoclip.lua", -- register history
    dependencies = {
      { "kkharji/sqlite.lua", module = "sqlite" },
    },
    config = function()
      require("neoclip").setup({
        enable_persistent_history = true,
        preview = true,
        default_register = "+",
      })

      -- This must come after the above neoclip setup function, or persistent history will not work
      require("telescope").load_extension("neoclip")
    end,
  },
}