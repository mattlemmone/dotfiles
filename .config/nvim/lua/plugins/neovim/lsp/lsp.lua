return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
		opts = {
			server = {
				override = false, -- don't setup LSP, we handle it separately
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		tag = "v1.0.0",
		config = function()
			require("fidget").setup({
				progress = {
					display = {
						progress_icon = { pattern = "dots", period = 1 },
					},
				},
				-- for catpuccin
				notification = {
					window = {
						winblend = 0,
					},
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig", -- easier lsp mgmt
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{
				"yioneko/nvim-vtsls",
				ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
				event = { "BufReadPre", "BufNewFile" },
			},
		},
		config = function()
			-- :h lsp-config
			local ls_with_default_settings = {
				"astro",
				"tailwindcss",
				"bashls",
				"buf_ls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"golangci_lint_ls",
				"gradle_ls",
				"html",
				"jsonls",
				"marksman",
				"pyright",
				"ruff",
				"sqls",
				"taplo",
				"terraformls",
				"vimls",
				"yamlls",
			}

			local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)
			local navic = require("nvim-navic")

			local on_attach_default = function(client, bufnr)
				-- Bread Crumbs
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end

				require("mlem.keymaps.lsp").registerKeymaps(bufnr)
			end

			-- Set global defaults for all LSP servers
			vim.lsp.config("*", {
				on_attach = on_attach_default,
				capabilities = capabilities,
			})

			-- Configure servers with default settings
			for _, server in ipairs(ls_with_default_settings) do
				vim.lsp.config(server, {})
			end

			-- Enable all default servers
			vim.lsp.enable(ls_with_default_settings)

			-- Configure and enable custom servers
			require("plugins.neovim.lsp.go").setup()
			require("plugins.neovim.lsp.kotlin").setup()
			require("plugins.neovim.lsp.lua_ls").setup()
			require("plugins.neovim.lsp.swift").setup()
			require("plugins.neovim.lsp.vtsls").setup()
			require("plugins.neovim.lsp.yaml_ls").setup()
		end,
	},
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup()
		end,
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "LspAttach",
		config = function()
			require("symbol-usage").setup()
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
	},
}
