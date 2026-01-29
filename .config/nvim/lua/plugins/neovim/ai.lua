return {
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					d2 = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},

				-- Disable for copilot cmp source
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = { "BufReadPost", "BufNewFile" },
		version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
		opts = {
			auto_suggestions_provider = "openai",
			provider = "openai",
			providers = {
				openai = {
					model = "gpt-4o",
				},
				anthropic = {
					model = "claude-3-5-sonnet-latest",
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
}
