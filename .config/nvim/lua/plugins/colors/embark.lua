return {
	"embark-theme/vim",
	name = "embark",
	enabled = true,
	config = function()
		vim.cmd([[
      colorscheme embark
    ]])

		require("lualine").setup({
			options = {
				theme = "embark",
			},
		})
	end,
}
