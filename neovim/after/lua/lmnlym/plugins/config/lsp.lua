local null_ls = require("null-ls")
local keymap = vim.keymap
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local nvim_lsp = require("lspconfig")

require("trouble").setup({})
require("mason").setup()
require("mason-lspconfig").setup()

null_ls.setup({
  sources = {
    require("typescript.extensions.null-ls.code-actions"),
    null_ls.builtins.diagnostics.todo_comments,
    -- Formatters are managed by Mason
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },
})

require("lspsaga").init_lsp_saga({
  border_style = "single",
  code_action_lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    in_custom = true,
  },
})

local on_attach_default = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Code Actions
  keymap.set({ "n", "v" }, "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)

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
  keymap.set("n", "<Leader>cac", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
  keymap.set("n", "<Leader>cal", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  keymap.set("n", "<Leader>e", "<cmd>TroubleToggle document_diagnostics<CR>", bufopts)

  -- Docs
  keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)

  --" Navigate errors
  keymap.set("n", "gE", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap.set("n", "ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  keymap.set("n", "<Leader>co", "<CMD>Lspsaga outline<CR>")

  --" Rename instances
  keymap.set("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", bufopts)

  --" Goto
  keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", bufopts)
  keymap.set("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", bufopts)
  keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", bufopts)
  keymap.set("n", "gr", "<CMD>Lspsaga lsp_finder<CR>", bufopts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local ls_with_default_settings = {
  "bashls",
  "cssls",
  "dockerls",
  "eslint",
  "golangci_lint_ls",
  "html",
  "terraformls",
  "yamlls",
  "vimls",
}

for _, v in ipairs(ls_with_default_settings) do
  nvim_lsp[v].setup({
    on_attach = on_attach_default,
    capabilities = capabilities,
  })
end

-- LS with nonstandard settings
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = on_attach_default,
  },
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

nvim_lsp.sumneko_lua.setup({
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

nvim_lsp.jsonls.setup({
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})
