local set_vim_key_map = require("utils/keys").set_vim_key_map

-- Largely ripped from https://github.com/LazyVim/LazyVim/blob/bb36f71b77d8e15788a5b62c82a1c9ec7b209e49/lua/lazyvim/plugins/extras/lang/rust.lua

return {
	{
		--  Auto configs rust-analyzer
		--  Do not call the nvim-lspconfig.rust_analyzer setup or set up the lsp client for rust-analyzer manually, as doing so may cause conflicts.
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		opts = {
			server = {
				on_attach = function(_, bufnr)
					-- register defaults first
					require("mlem.keymaps.lsp").registerKeymaps(bufnr)

					set_vim_key_map({
						mode = { "n" },
						useLeader = true,
						sequence = "ca",
						command = function()
							vim.cmd.RustLsp("codeAction")
						end,
						buffer = bufnr,
						description = "Code Actions",
					})
					set_vim_key_map({
						mode = { "n" },
						useLeader = true,
						sequence = "dr",
						command = function()
							vim.cmd.RustLsp("debuggables")
						end,
						buffer = bufnr,
						description = "Rust Debuggables",
					})
					set_vim_key_map({
						mode = { "n" },
						useLeader = false,
						sequence = "K",
						buffer = bufnr,
						command = function()
							vim.cmd.RustLsp({ "hover", "actions" })
						end,
					})
					set_vim_key_map({
						mode = { "n" },
						useLeader = false,
						sequence = "J",
						buffer = bufnr,
						command = function()
							vim.cmd.RustLsp("joinLines")
						end,
					})
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							runBuildScripts = true,
						},
						-- Add clippy lints for Rust.
						checkOnSave = {
							allFeatures = true,
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
		keys = {},
	},
	{
		-- crates.nvim now provides completions through LSP, not cmp source
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				rust_analyzer = {},
				taplo = {
					keys = {
						{
							"K",
							function()
								if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
									require("crates").show_popup()
								else
									vim.lsp.buf.hover()
								end
							end,
							desc = "Show Crate Documentation",
						},
					},
				},
			},
			setup = {
				rust_analyzer = function()
					return true
				end,
			},
		},
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		opts = function(_, opts)
			opts.adapters = opts.adapters or {}
			vim.list_extend(opts.adapters, {
				require("rustaceanvim.neotest"),
			})
		end,
	},
}
