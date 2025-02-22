local set_vim_key_map = require("utils/keys").set_vim_key_map

return {
	{ "tpope/vim-commentary", event = "VeryLazy" }, -- commenting
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "arthurxavierx/vim-caser", event = "VeryLazy" },
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		version = "*",
		keys = {
			{
				"<Leader>/",
				"<CMD>lua require('neogen').generate()<CR>",
				mode = "n",
				noremap = true,
				silent = true,
				desc = "Generate Doc Strings",
			},
		},
	},
	{
		"simnalamburt/vim-mundo",
		keys = {
			{
				"<Leader>m",
				"<CMD>MundoToggle<CR>",
				mode = "n",
				silent = true,
			},
		},
	}, -- undo tree
	{
		"FooSoft/vim-argwrap",
		keys = {
			{ "<Leader>w", "<CMD>ArgWrap<CR>", mode = "n", silent = true },
		},
	}, -- auto inline/multiline args
	{
		"inkarkat/vim-ReplaceWithRegister",
		keys = {
			{ "<Leader>p", "<Plug>ReplaceWithRegisterOperator", mode = "n" },
			{ "<Leader>pp", "<Plug>ReplaceWithRegisterLine", mode = "n" },
			{ "<Leader>p", "<Plug>ReplaceWithRegisterVisual", mode = "x" },
		},
	}, -- ez replace motion with register contents
	"markonm/traces.vim", -- live subst preview
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	}, -- improved % matching
	{
		"anuvyklack/pretty-fold.nvim",
		event = "VeryLazy",
		config = function()
			require("pretty-fold").setup({})
		end,
	}, -- foldinggg
	{
		"monaqa/dial.nvim",
		event = "VeryLazy",
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.date.alias["%m/%d/%Y"],
					augend.date.new({
						pattern = "%a, %b %d %Y",
						default_kind = "day",
						only_valid = true,
						word = false,
					}),
					augend.constant.alias.bool,
					augend.semver.alias.semver,
				},
			})

			vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
			vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
			vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
			vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
			vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
			vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
		end,
	}, -- easy inc/dec/toggling of types
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
    "windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
	{
		"Wansmer/treesj",
		keys = { "<space>J", "<space>j" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				use_default_keymaps = false,
			})

			set_vim_key_map({
				mode = { "n" },
				useLeader = true,
				sequence = "J",
				command = function()
					require("treesj").join()
				end,
				description = "Join",
			})

			set_vim_key_map({
				mode = { "n" },
				useLeader = true,
				sequence = "j",
				command = function()
					require("treesj").split()
				end,
				description = "Un-join",
			})
		end,
	},
}
