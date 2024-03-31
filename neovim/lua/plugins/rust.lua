local create_key_map = require("utils/keys").create_key_map

return {
	{
		--  Auto configs rust-analyzer
		--  Do not call the nvim-lspconfig.rust_analyzer setup or set up the lsp client for rust-analyzer manually, as doing so may cause conflicts.
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		keys = {
			create_key_map({
				mode = { "n" },
				useLeader = true,
				sequence = "qf",
				command = function()
					vim.cmd.RustLsp("codeAction")
				end,
			}),
			create_key_map({
				mode = { "n" },
				useLeader = true,
				sequence = "ca",
				command = function()
					vim.cmd.RustLsp({ "hover", "actions" })
				end,
			}),
			create_key_map({
				mode = { "n" },
				useLeader = false,
				sequence = "J",
				command = function()
					vim.cmd.RustLsp("joinLines")
				end,
			}),
		},
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}
