local keymap = vim.keymap

return {
  {
    --- sort of diagnostics?
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      {
        "gw",
        mode = { "n", "x" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
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
  {
    "lukas-reineke/lsp-format.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lsp-format").setup({
        kotlin = {
          exclude = { "kotlin_language_server" },
        },
        python = {
          exclude = { "pylsp" },
        },
      })
    end,
  },
  { "folke/lsp-colors.nvim", event = { "BufReadPre", "BufNewFile" } }, -- backfill missing lsp highlight colors
  {
    "yioneko/nvim-vtsls",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "pmizio/typescript-tools.nvim", -- replacement for other ts plugins; be sure to disable while testing this
    enabled = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
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
      local navbuddy = require("nvim-navbuddy")

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.diagnostics.todo_comments,
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.diagnostics.eslint_d.with({
            cwd = function(params)
              return nvim_lsp.util.root_pattern("src/tsconfig.json")(params.bufname)
              -- or nvim_lsp.util.root_pattern("ops-tools/tsconfig.eslint.json")(params.bufname)
            end,
          }),
          -- Some Linters are managed by Mason
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.diagnostics.vacuum,
          -- Formatters are managed by Mason
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.buf,
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.formatting.ktlint,
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.shfmt,
          null_ls.builtins.formatting.stylua,
        },
      })

      local on_attach_default = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        -- Bread Crumbs
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
          navbuddy.attach(client, bufnr)
        end

        -- Format on save
        require("lsp-format").on_attach(client)

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
        "cssls",
        "dockerls",
        "docker_compose_language_service", -- docker-compose
        "golangci_lint_ls",
        "gradle_ls",
        "html",
        "marksman",
        "pylsp",
        -- "pyright",
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

      -- LS with nonstandard settings
      --
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
