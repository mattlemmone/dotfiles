local lspkind = require("lspkind")
local cmp = require("cmp")
local null_ls = require("null-ls")
local saga = require("lspsaga")
local keymap = vim.keymap

require("trouble").setup({})
require("mason").setup()
require("mason-lspconfig").setup()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.todo_comments,
    null_ls.builtins.formatting.black,
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.diagnostics.eslint,
  },
})

saga.init_lsp_saga({
  border_style = "single",
  code_action_lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    in_custom = true,
  },
})

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "text_symbol",
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function (entry, vim_item)
      --   ...
      --   return vim_item
      --
      -- end
    }),
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("snippy").expand_snippet(args.body)
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
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = "treesitter" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "snippy" },
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),

  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)
  keymap.set({ "n", "v" }, "<Leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
  keymap.set("n", "<Leader>cac", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
  keymap.set("n", "<Leader>cal", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  keymap.set("n", "<Leader>e", "<cmd>TroubleToggle document_diagnostics<CR>", bufopts)

  -- Apply AutoFix to problem on the current line.
  -- set_keymap("n", "<Leader>qf", "<Plug>(coc-fix-current)")

  --" Navigate errors
  keymap.set("n", "gE", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  keymap.set("n", "ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
  keymap.set("n", "<Leader>co", "<CMD>Lspsaga outline<CR>")

  --" Rename instances
  keymap.set("n", "<Leader>rn", "<CMD>Lspsaga rename<CR>", bufopts)

  --" Goto
  keymap.set("n", "gd", "<CMD>Lspsaga peek_definition<CR>", bufopts)
  keymap.set("n", "gt", "vim.lsp.buf.type_definition", bufopts)
  keymap.set("n", "gi", "vim.lsp.buf.implementation", bufopts)
  keymap.set("n", "gr", "<CMD>Lspsaga lsp_finder<CR>", bufopts)
end

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
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
  on_attach = on_attach,
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
