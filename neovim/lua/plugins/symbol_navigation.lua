return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "AerialToggle",
	keys = {
		{
			"<Leader>t",
			"<CMD>AerialToggle<CR>",
			mode = "n",
			noremap = true,
			silent = true,
		},
	},
	config = function()
		require("aerial").setup({
			layout = {
				min_width = 20,
			},
			backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
			default_direction = "prefer_right",
			resize_to_content = true,
			close_on_select = true,
			filter_kind = {
				-- "Array",
				-- "Boolean",
				"Class",
				"Constant",
				"Constructor",
				"Enum",
				-- "EnumMember",
				"Event",
				"Field",
				-- "File",
				"Function",
				"Interface",
				-- "Key",
				"Method",
				"Module",
				"Namespace",
				-- "Null",
				"Number",
				"Object",
				"Operator",
				"Package",
				-- "Property",
				"String",
				"Struct",
				"TypeParameter",
				"Variable",
			},
			highlight_on_hover = true,
			autojump = true,
			manage_folds = true,
			link_folds_to_tree = true,
			link_tree_to_folds = true,
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})

		-- require("telescope").load_extension("aerial")
	end,
}
