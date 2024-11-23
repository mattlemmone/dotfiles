return {
	{
		"zbirenbaum/copilot.lua",
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
		"olimorris/codecompanion.nvim",
		lazy = false,
		keys = {
			{ "<leader>aa", vim.cmd.CodeCompanionActions, mode = { "n" }, desc = "Code Companion Actions" },
			{
				"<leader>ac",
				function()
					vim.cmd.CodeCompanionChat("Toggle")
				end,
				mode = { "n" },
				desc = "Code Companion Chat",
			},
			{
				"<leader>ad",
				function()
					require("codecompanion").prompt("lsp")
				end,
				mode = { "v" },
				desc = "Debug Diagnostics",
			},
			{
				"<leader>af",
				function()
					require("codecompanion").prompt("fix")
				end,
				mode = { "v" },
				desc = "Fix Code",
			},
			{
				"<leader>ao",
				function()
					require("codecompanion").prompt("optimize")
				end,
				mode = { "v" },
				desc = "Optimize",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- The following are optional:
			"nvim-telescope/telescope.nvim", -- For using slash commands
			{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
		},
		config = function()
			require("codecompanion").setup({
				display = {
					diff = {
						enabled = false,
					},
				},
				prompt_library = require("mlem.codecompanion").get_prompt_library(),
				strategies = {
					chat = {
						adapter = "openai",
					},
					inline = {
						adapter = "copilot",
					},
				},
			})
			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}
