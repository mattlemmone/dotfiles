local keymap = vim.keymap

return {
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		tag = "legacy",
		config = function()
			require("fidget").setup({
				text = { spinner = "dots" },
			})
		end,
	},
	{ "folke/lsp-colors.nvim", event = { "BufReadPre", "BufNewFile" } }, -- backfill missing lsp highlight colors
	{
		"yioneko/nvim-vtsls",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig", -- easier lsp mgmt

			{
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
			},
			{
				"utilyre/barbecue.nvim",
				event = "VeryLazy",
				name = "barbecue",
				version = "*",
				dependencies = {
					{
						"smiteshp/nvim-navic",
						config = function()
							local navic = require("nvim-navic")
							navic.setup({
								lsp = {
									preference = { "pyright" },
								},
							})
						end,
					},
					"nvim-tree/nvim-web-devicons", -- optional dependency
				},
				opts = {
					-- configurations go here
				},
			},
			{
				"SmiteshP/nvim-navbuddy",
				requires = {
					"neovim/nvim-lspconfig",
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
					"nvim-telescope/telescope.nvim", -- Optional
				},
			},
		},
		config = function()
			local null_ls = require("null-ls")
			local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)
			local nvim_lsp = require("lspconfig")
			local navic = require("nvim-navic")
			local navbuddy = require("nvim-navbuddy")

			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.code_actions.refactoring,
					null_ls.builtins.code_actions.shellcheck,
				},
			})

			local on_attach_default = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }

				-- Bread Crumbs
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
					navbuddy.attach(client, bufnr)
					-- require("aerial").on_attach(bufnr)
				end

				-- Code Actions
				keymap.set({ "n", "v" }, "<Leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", bufopts)

				-- Quick Fix
				keymap.set({ "n", "v" }, "<Leader>qf", "", {
					callback = function()
						vim.lsp.buf.code_action({
							apply = true,
							context = { only = { "quickfix", "f" } },
						})
					end,
				})

				-- Diagnostics
				keymap.set("n", "<Leader>e", "<CMD>Telescope diagnostics<CR>", bufopts)

				-- Docs
				keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", bufopts)

				--" Rename instances
				keymap.set("n", "<Leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", bufopts)

				--" Goto
				keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", bufopts)
				keymap.set("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", bufopts)
				keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", bufopts)
				keymap.set("n", "gr", "<CMD>Telescope lsp_references initial_mode=normal<CR>", bufopts)
			end

			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			local ls_with_default_settings = {
				"bashls",
				"bufls",
				"cssls",
				"dockerls",
				"docker_compose_language_service", -- docker-compose
				"golangci_lint_ls",
				"gradle_ls",
				"html",
				"marksman",
				"pyright",
				"ruff_lsp",
				"terraformls",
				"vimls",
				"yamlls",
			}

			for _, v in ipairs(ls_with_default_settings) do
				nvim_lsp[v].setup({
					on_attach = on_attach_default,
					capabilities = capabilities,
				})
			end

			require("lspconfig.configs").vtsls = require("vtsls").lspconfig

			-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
			require("lspconfig").vtsls.setup({
				on_attach = on_attach_default,
				capabilities = capabilities,
			})

			nvim_lsp.gopls.setup({
				on_attach = on_attach_default,
				capabilities = capabilities,
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
				init_options = {
					usePlaceholders = true,
				},
			})

			nvim_lsp.yamlls.setup({
				on_attach = on_attach_default,
				settings = {
					yaml = {
						-- remove mapKeyOrder warning
						keyOrdering = false,
					},
				},
			})

			nvim_lsp.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach_default,
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			nvim_lsp.kotlin_language_server.setup({
				capabilities = capabilities,
				on_attach = on_attach_default,
				settings = {
					compiler = { jvm = { target = "1.8.10" } },
				},
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	}, -- lsp package mgr
}
