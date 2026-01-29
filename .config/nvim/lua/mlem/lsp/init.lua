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
require("mlem.lsp.go").setup()
require("mlem.lsp.kotlin").setup()
require("mlem.lsp.lua_ls").setup()
require("mlem.lsp.swift").setup()
require("mlem.lsp.vtsls").setup()
require("mlem.lsp.yaml_ls").setup()
