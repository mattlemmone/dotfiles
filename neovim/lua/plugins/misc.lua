return {
	-- more or less global lua deps
	"MunifTanjim/nui.nvim", -- ui
	"nvim-lua/plenary.nvim", -- misc lua functions
	"kkharji/sqlite.lua", -- used for sqlite DBs. neoclip only?

	-- Misc
	{
		"folke/which-key.nvim",

		config = function()
			require("which-key").setup({})
		end,
	},
	-- "glacambre/firenvim", {
	--  build = function(,
	--   vim.fn["firenvim#install"](0)
	--  end,
	--}, -- nvim? in the BROWSER?
	"kristijanhusak/vim-carbon-now-sh", -- Screenshot and upload code to carbon.now.sh
	{
		"lewis6991/impatient.nvim",

		config = function()
			require("impatient")
		end, -- keep this at the top
	}, -- lua module caching to improve startup time
	"metakirby5/codi.vim", -- live eval mode
	{
		"michaelb/sniprun",
		build = "bash install.sh",
		config = function()
			require("sniprun").setup({
				display = {
					"NvimNotify", --# display with the nvim-notify plugin
				},
			})
		end,
	}, -- execute lines of selected code
	"nathom/filetype.nvim", -- speed up boot time by optimizing filetype autocmd creation
	"sudormrfbin/cheatsheet.nvim",
}
