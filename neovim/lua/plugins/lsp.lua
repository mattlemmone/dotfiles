return {
  { "lukas-reineke/lsp-format.nvim", event = { "BufReadPre", "BufNewFile" } },
  { "folke/lsp-colors.nvim",         event = { "BufReadPre", "BufNewFile" } }, -- backfill missing lsp highlight colors
  {
    "pmizio/typescript-tools.nvim",                                   -- replacement for other ts plugins; be sure to disable while testing this
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("trouble").setup({})
    end,
  }, -- diagnostics
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig", -- easier lsp mgmt
      {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        name = "barbecue",
        version = "*",
        dependencies = {
          "smiteshp/nvim-navic",
          "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
          -- configurations go here
        },
      },
    },
    config = function()
      local null_ls = require("null-ls")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local nvim_lsp = require("lspconfig")
      local navic = require("nvim-navic")

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.diagnostics.todo_comments,
          null_ls.builtins.diagnostics.eslint.with({
            cwd = function(params)
              return nvim_lsp.util.root_pattern("src/tsconfig.json")(params.bufname)
              -- or nvim_lsp.util.root_pattern("ops-tools/tsconfig.eslint.json")(params.bufname)
            end,
          }),
          -- Some Linters are managed by Mason
          null_ls.builtins.diagnostics.buf,
          -- Formatters are managed by Mason
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.buf,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.eslint,
          null_ls.builtins.formatting.ktlint,
          null_ls.builtins.formatting.stylua,
        },
      })

      local on_attach_default = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap

        -- Bread Crumbs
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        -- Format on save
        require("lsp-format").on_attach(client)

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
        -- "pyright",
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
      require("typescript-tools").setup({
        on_attach = on_attach_default,
        -- handlers = { ... },
        settings = {
          separate_diagnostic_server = true,
          tsserver_file_preferences = {
            includeCompletionsForModuleExports = true,
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayVariableTypeHints = true,
            quotePreference = "auto",
          },
          publish_diagnostic_on = "insert_leave",
          tsserver_path = nil,
          -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
          tsserver_plugins = {},
          tsserver_max_memory = "auto",
          tsserver_format_options = {},
        },
      })

      -- require("typescript").setup({
      --   disable_commands = false, -- prevent the plugin from creating Vim commands
      --   debug = false,            -- enable debug logging for commands
      --   go_to_source_definition = {
      --     fallback = true,        -- fall back to standard LSP definition on failure
      --   },
      --   server = {
      --     -- pass options to lspconfig's setup method
      --     on_attach = function(client, bufnr)
      --       -- Disable, prefer null-ls!
      --       -- client.server_capabilities.documentFormattingProvider = false
      --       on_attach_default(client, bufnr)
      --     end,
      --   },
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

      nvim_lsp.kotlin_language_server.setup({
        capabilities = capabilities,
        on_attach = on_attach_default,
        -- Commenting this out since an official release came out to support 1.8.10 and it's not necessary to run locally
        -- cmd = {
        --   "/Users/matt/Dev/kotlin-language-server/server/build/install/server/bin/kotlin-language-server",
        -- },
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
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_lines").setup()
      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}
