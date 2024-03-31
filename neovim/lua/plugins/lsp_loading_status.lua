return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",
	tag = "legacy",
	config = function()
		require("fidget").setup({ text = { spinner = "dots" } })
	end,
}
