local keymap = vim.keymap

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig", -- easier lsp mgmt
	},
	config = function()
		local null_ls = require("null-ls")
		local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)
		local nvim_lsp = require("lspconfig")
		local navic = require("nvim-navic")

		null_ls.setup({
			sources = {
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.code_actions.shellcheck,
			},
		})

		local on_attach_default = function(client, bufnr)
			-- Bread Crumbs
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end

			local bufopts = { noremap = true, silent = true, buffer = bufnr }

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
}
