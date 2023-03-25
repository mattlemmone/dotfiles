return {
  "folke/lsp-colors.nvim", -- backfill missing lsp highlight colors
  "onsails/lspkind.nvim", -- styling for cmp
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  }, -- diagnostics
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig", -- easier lsp mgmt
    },
    config = function()
      local null_ls = require("null-ls")
      local keymap = vim.keymap
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local nvim_lsp = require("lspconfig")

      null_ls.setup({
        sources = {
          require("typescript.extensions.null-ls.code-actions"),
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.diagnostics.todo_comments,
          null_ls.builtins.diagnostics.eslint.with({
            cwd = function(params)
              return nvim_lsp.util.root_pattern("src/tsconfig.json")(params.bufname)
              -- or nvim_lsp.util.root_pattern("ops-tools/tsconfig.eslint.json")(params.bufname)
            end,
          }),
          -- Some Linters are managed by Mason
          null_ls.builtins.diagnostics.protolint,
          -- Formatters are managed by Mason
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.ktlint,
          null_ls.builtins.formatting.stylua,
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
        keymap.set("n", "<Leader>e", "<cmd>TroubleToggle document_diagnostics<CR>", bufopts)

        -- Docs
        keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", bufopts)

        --" Navigate errors
        keymap.set("n", "gE", "<cmd>lua vim.diagnostic.goto_prev()<CR>", bufopts)
        keymap.set("n", "ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", bufopts)

        --" Rename instances
        keymap.set("n", "<Leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>", bufopts)

        --" Goto
        keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", bufopts)
        keymap.set("n", "gt", "<CMD>lua vim.lsp.buf.type_definition()<CR>", bufopts)
        keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", bufopts)
        keymap.set("n", "gr", "<CMD>Telescope lsp_references<CR>", bufopts)
      end

      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      local ls_with_default_settings = {
        "bashls",
        "cssls",
        "dockerls",
        "golangci_lint_ls",
        "gradle_ls",
        "html",
        "pylsp",
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
        server = {
          -- pass options to lspconfig's setup method
          on_attach = function(client, bufnr)
            -- Disable, prefer null-ls!
            -- client.server_capabilities.documentFormattingProvider = false
            on_attach_default(client, bufnr)
          end,
        },
      })

      -- nvim_lsp.eslint.setup({
      --   on_attach = on_attach_default,
      --   capabilities = capabilities,
      -- })

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

      nvim_lsp.jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
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
    config = function()
      require("mason").setup()
    end,
  }, -- lsp package mgr
}
