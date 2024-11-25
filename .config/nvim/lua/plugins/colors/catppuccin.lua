return {
	{
		"catppuccin/nvim",
		priority = 1000,
		enabled = false,
		name = "catppuccin",
		event = "VimEnter",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- background = {
				-- light = "latte",
				-- 	dark = "mocha",
				-- },
				transparent_background = false,
				term_colors = false,
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					notify = true,
					leap = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					mason = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					aerial = true,
					barbecue = {
						dim_dirname = true, -- directory name is dimmed by default
						bold_basename = true,
						dim_context = false,
						alt_background = false,
					},
					fidget = true,
					flash = true,
					treesitter = true,
					overseer = true,
					illuminate = {
						enabled = true,
						lsp = false,
					},
					markdown = true,
					noice = true,
					which_key = true,
					mini = true,
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
