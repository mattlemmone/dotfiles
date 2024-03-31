local M = {}

-- :h lspconfig-all
local ls_with_default_settings = {
	"bashls",
	"bufls",
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
	"ruff_lsp",
	"sqls",
	"terraformls",
	"vimls",
	"yamlls",
}

M.setup = function()
	local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
	local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp_capabilities)
	local nvim_lsp = require("lspconfig")
	local navic = require("nvim-navic")

	local on_attach_default = function(client, bufnr)
		-- Bread Crumbs
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end

		require("config.lsp.keymaps").registerKeymaps(bufnr)
	end

	for _, v in ipairs(ls_with_default_settings) do
		nvim_lsp[v].setup({
			on_attach = on_attach_default,
			capabilities = capabilities,
		})
	end

	require("config.lsp.vtsls").setup(on_attach_default, capabilities)
	require("config.lsp.go").setup(on_attach_default, capabilities)
	require("config.lsp.lua_ls").setup(on_attach_default, capabilities)
	require("config.lsp.yaml_ls").setup(on_attach_default)
	require("config.lsp.kotlin").setup(on_attach_default, capabilities)
end

return M
