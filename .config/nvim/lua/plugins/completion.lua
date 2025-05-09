local snippetsDir = "~/dotfiles/.config/nvim/snippets/"
local vscodeSnippetDir = snippetsDir .. "vscode"
local snipmateSnippetDir = snippetsDir .. "snipmate"

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"tailwind-tools",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim", -- styling for cmp
			{
				"chrisgrieser/nvim-scissors",
				dependencies = "nvim-telescope/telescope.nvim",
				opts = {
					snippetDir = vscodeSnippetDir,
				},
			},
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end,
			},
			{
				"L3MON4D3/LuaSnip",
				event = { "BufReadPost", "BufNewFile" },
				build = "make install_jsregexp",
				config = function()
					require("luasnip.loaders.from_snipmate").lazy_load({
						paths = snipmateSnippetDir,
					})
					require("luasnip.loaders.from_vscode").lazy_load({
						paths = vscodeSnippetDir,
					})
				end,
			},
		},
		opts = function()
			return {
				formatting = {
					format = require("lspkind").cmp_format({
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				},
			}
		end,
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						-- mode = "symbol",
						mode = "symbol_text",
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						symbol_map = { Copilot = "" },
						menu = {
							luasnip = "[snippet]",
							nvim_lua = "[nvim]",
							nvim_lsp = "[LSP]",
							path = "[path]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<A-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip", group_index = 1 },
					{ name = "nvim_lsp", group_index = 2 },
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lua", group_index = 2 },
					{ name = "buffer", group_index = 3, min_length = 3 },
					{ name = "path", group_index = 3 },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "nvim_lsp_document_symbol" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "cmdline" },
				}),
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	}, -- completion engine
}
